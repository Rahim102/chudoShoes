using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace chudoShoes
{
    /// <summary>
    /// Логика взаимодействия для AnalyticsWindow.xaml
    /// </summary>
    public partial class AnalyticsWindow : Window
    {
        private shoesEntities1 _db = new shoesEntities1();
        private bool _isLoaded = false;
        public AnalyticsWindow()
        {
            InitializeComponent();
            DateTime now = DateTime.Now;
            StartDateBox.Text = new DateTime(now.Year, now.Month, 1).ToString("dd.MM.yyyy");
            EndDateBox.Text = new DateTime(now.Year, now.Month, DateTime.DaysInMonth(now.Year, now.Month)).ToString("dd.MM.yyyy");
            _isLoaded = true;
            Calculate();

        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            new ProductWindow().Show();
            Close();
        }

        private void StartDateBox_TextChanged(object sender, TextChangedEventArgs e)
        {
            if (_isLoaded)
            {
                Calculate();
            }
        }
        private void Calculate()
        {
            if (!DateTime.TryParse(StartDateBox.Text, out DateTime start) ||
                !DateTime.TryParse(EndDateBox.Text, out DateTime end))
            {
                return;
            }
            if (start > end)
            {
                MessageBox.Show("Дата начало не может быть позже даты окончания!");
                return;
            }
            DateTime endOfDay = end.Date.AddDays(1).AddSeconds(-1);
            var order = _db.Order
                .Where(o => o.OrderDate >= start && o.OrderDate <= endOfDay)
                .ToList();
            TotalOrdersText.Text = order.Count.ToString();
            decimal totalSum = order
                .SelectMany(o => o.OrderInProduct)
                .Sum(op => (decimal?)((op.Quantity ?? 0) * op.UnitPrice)) ?? 0;
            TotalSumText.Text = $"{totalSum:N2} руб";
            var top5 = order
                .SelectMany(o => o.OrderInProduct)
                .Where(op => op.StockItem != null && op.StockItem.Product != null)
                .GroupBy(op => op.StockItem.Product)
                .Select(g => new
                {
                    Name = g.Key.Name,
                    Manufacturer = g.Key.Manufacturer != null ? g.Key.Manufacturer.Name : "Не указан",
                    Count = g.Sum(x => x.Quantity ?? 0)
                })
                .OrderByDescending(x=>x.Count).
                Take(5)
                .ToList();
            TopGrid.ItemsSource = top5;




        }

        
        private void EndDateBox_TextChanged(object sender, TextChangedEventArgs e)
        {

        }

        private void ExportPdf_Click(object sender, RoutedEventArgs e)
        {

        }
    }
}
