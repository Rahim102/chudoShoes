using chudoShoes.Helper;
using chudoShoes.Static;
using System.Linq;
using System.Windows;

namespace chudoShoes
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        private shoesEntities1 _db = new shoesEntities1();
        private MessageHelper _mh = new MessageHelper();
        public MainWindow()
        {
            InitializeComponent();
        }

        private void LoginButton_Click(object sender, RoutedEventArgs e)
        {
            string login = LoginEnter.Text;
            var user = _db.User.Where (u=>u.Login==login).FirstOrDefault();
            if (user == null)
            {
                _mh.ShowError("Введен не правильный логин!");
                return;
            }
            else
            {
                CurrentSession.CurrentUser = user;
                new ProductWindow(user).Show();
                Close();
            }

        }
    }
}
