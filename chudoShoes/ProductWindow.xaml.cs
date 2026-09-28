using chudoShoes.Helper;
using chudoShoes.Static;
using chudoShoes.ViewModels;
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
    /// Логика взаимодействия для ProductWindow.xaml
    /// </summary>
    public partial class ProductWindow : Window
    {
        private shoesEntities1 _db = new shoesEntities1();
        private MessageHelper _mbh = new MessageHelper();
        private List<ProductViewModel> _productViewModel = new List<ProductViewModel>();
        private string[] _sortingTypes = new string[]
        {
            "По умолчанию",
            "По убыванию",
            "По возрастанию"
        };
        private List<string> _filteringTypes = new List<string>()
        {
            "Все категории"
        };
        public ProductWindow()
        {
            InitializeComponent();
            LoadProduct();
            LoadData();
            LoadUI();

        }

        private void LoadUI()
        {
            User user = CurrentSession.CurrentUser;
            if (user.RoleId == 3)
            {
                AdmPanel.Visibility = Visibility.Collapsed;
            }
            else if (user.RoleId == 1)
            {
                CreateButton.Visibility = Visibility.Visible;
            }
        }

        private void LoadData()
        {
            SortingCB.ItemsSource = _sortingTypes;
            SortingCB.SelectedIndex = 0;
            var category = _db.Category.ToList();
            foreach (var p in category)
                _filteringTypes.Add(p.Name);
            FilteringCB.ItemsSource = _filteringTypes;
            FilteringCB.SelectedIndex = 0;
            User user = CurrentSession.CurrentUser;
            if (user != null)
                FullName.Text = $"{user.FirstName} {user.LastName} {user.Patronymic}";
        }

        private void LoadProduct()
        {
         _productViewModel=_db.Product.ToList().Select(p=>new ProductViewModel(p)).ToList();
           
            ProductList.ItemsSource = _productViewModel;
        }
        private void Update()
        {
            string searchingText = SearchingTB.Text.ToLower();
            _productViewModel = _db.Product
                .Where(p =>
                    p.Name.ToLower().Contains(searchingText) ||
                    p.Description.ToLower().Contains(searchingText)
                )
                .ToList()
                .Select(p => new ProductViewModel(p))
                .ToList();
          



            if (SortingCB.SelectedIndex == 1)
            {
                _productViewModel = _productViewModel.OrderByDescending(p => p.Cost).ToList();
            }
            else if (SortingCB.SelectedIndex == 2)
            {
                _productViewModel = _productViewModel.OrderBy(p => p.Cost).ToList();
            }
            string FilterText = FilteringCB.SelectedItem?.ToString();
            if (FilterText != "Все категории")
            { _productViewModel = _productViewModel
                    .Where(p => p.Subcategory.Category
                    .Name == FilterText)
                    .ToList(); }
            ProductList.ItemsSource = _productViewModel;
        }
        private void LogOutButton_Click(object sender, RoutedEventArgs e)
        {
            CurrentSession.CurrentUser = null;
            new MainWindow().Show();
            Close(); 
        }

        private void SearchingTB_TextChanged(object sender, TextChangedEventArgs e)
        {
      
            Update();
        }

        private void SortingCB_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            Update();

        }

        private void FilteringCB_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            Update();

        }

        private void CreateButton_Click(object sender, RoutedEventArgs e)
        {
            new AddEditProduct(null).Show();
            Close();
        }

        private void Border_MouseDown(object sender, MouseButtonEventArgs e)
        {
            User user = CurrentSession.CurrentUser;
            if (user.RoleId != 1)
                return;
            int id = (int)(sender as Border).Tag;
            new AddEditProduct(id).Show();
            Close();
        }
    }
}
