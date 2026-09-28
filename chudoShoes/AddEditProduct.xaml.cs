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
    /// Логика взаимодействия для AddEditProduct.xaml
    /// </summary>
    public partial class AddEditProduct : Window
    {
        private shoesEntities1 _db=new shoesEntities1();

        private bool _isEditing;
        private Product _product;
        public AddEditProduct(int? id)
        {
            InitializeComponent();

            if (id ==null)
            {
                _isEditing = false;

            }
            else
            {
                _isEditing=true;
            }
        }
    }
}
