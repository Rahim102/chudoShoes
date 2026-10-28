using chudoShoes.Helper;
using chudoShoes.Static;
using System;
using System.Linq;
using System.Windows;
using System.Windows.Controls;

namespace chudoShoes
{
    public partial class AddEditProduct : Window
    {
        private shoesEntities1 _db = new shoesEntities1();
        private MessageHelper _mh = new MessageHelper();
        private Product _product;

        // Элемент для выпадающего списка
        public class SizeItem
        {
            public StockItem Stock { get; set; }
            public string SizeText => $"Размер: {Stock.Size?.Size1} (остаток: {Stock.AviableQuantity} шт.)";
        }

        public AddEditProduct(int? id)
        {
            InitializeComponent();

            // Показываем ФИО
            if (CurrentSession.CurrentUser != null)
                UserFioText.Text = $"{CurrentSession.CurrentUser.LastName} {CurrentSession.CurrentUser.FirstName}";

            // Загружаем товар
            _product = _db.Product.FirstOrDefault(p => p.Id == id);
            if (_product == null) return;

            // Заполняем данные
            NameText.Text = _product.Name;
            InfoText.Text = $"Производитель: {_product.Manufacturer?.Name}\nКатегория: {_product.Subcategory?.Category?.Name}\nСостав: {_product.Material}\nОписание: {_product.Description}";
            CostText.Text = $"Цена: {_product.Cost} руб.";

            // Размеры
            var sizes = _product.StockItem.Select(s => s.Size?.Size1).Where(s => s != null);
            SizesText.Text = $"Все размеры: {string.Join(", ", sizes)}";

            // Доступные для заказа
            var available = _product.StockItem
                .Where(s => s.AviableQuantity > 0)
                .Select(s => new SizeItem { Stock = s })
                .ToList();

            SizesCombo.ItemsSource = available;
            if (available.Count > 0)
                SizesCombo.SelectedIndex = 0;
            else
                MaxCountText.Text = "Нет в наличии";
        }

        private void SizesCombo_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (SizesCombo.SelectedItem is SizeItem item)
                MaxCountText.Text = $"Доступно на складе: {item.Stock.AviableQuantity} шт.";
        }

        private void Button_Click_2(object sender, RoutedEventArgs e)
        {
            var selected = SizesCombo.SelectedItem as SizeItem;
            if (selected == null)
            {
                _mh.ShowWarning("Выберите размер!");
                return;
            }

            if (!int.TryParse(CountBox.Text, out int count) || count <= 0)
            {
                _mh.ShowWarning("Введите корректное число больше 0!");
                return;
            }

            var stock = _db.StockItem.First(s => s.Id == selected.Stock.Id);
            if (count > stock.AviableQuantity)
            {
                _mh.ShowError($"Нельзя заказать больше чем есть! На складе: {stock.AviableQuantity} шт.");
                return;
            }

            // Создаем заказ
            var order = new Order
            {
                UserId = CurrentSession.CurrentUser.Id,
                OrderDate = DateTime.Now
            };
            _db.Order.Add(order);

            // Добавляем позицию в заказ
            var orderInProduct = new OrderInProduct
            {
                Order = order,
                StockItemId = stock.Id,
                Quantity = count,
                UnitPrice = _product.Cost
            };
            _db.OrderInProduct.Add(orderInProduct);

            // Списываем количество со склада
            stock.AviableQuantity -= count;

            _db.SaveChanges();

            _mh.ShowInfo("Заказ успешно оформлен!");
            GoBack();
        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            if (MessageBox.Show("Отказаться от оформления заказа?", "Отказ", MessageBoxButton.YesNo, MessageBoxImage.Question) == MessageBoxResult.Yes)
                GoBack();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            GoBack();
        }

        private void GoBack()
        {
            new ProductWindow().Show();
            Close();
        }
    }
}