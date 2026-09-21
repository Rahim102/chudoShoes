using chudoShoes.Static;
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
        public ProductWindow()
        {
            InitializeComponent();
            LoadProduct();
        }
        public ProductWindow(User user)
        {
            InitializeComponent();
            LoadProduct();
        }
        private void LoadProduct()
        {
            ProductList.ItemsSource = _db.Product.ToList();
        }
        private void LogOutButton_Click(object sender, RoutedEventArgs e)
        {
            CurrentSession.CurrentUser = null;
            new MainWindow().Show();
            Close(); 
        }
    }
}
