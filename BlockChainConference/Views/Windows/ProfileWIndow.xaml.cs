using BlockChainConference.Model;
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

namespace BlockChainConference.Views.Windows
{
    /// <summary>
    /// Логика взаимодействия для ProfileWIndow.xaml
    /// </summary>
    public partial class ProfileWIndow : Window
    {
        public ProfileWIndow(Organizer selectedUser)
        {
            InitializeComponent();
            ProfileGrid.DataContext = selectedUser;
            PasswordGrid.Visibility = Visibility.Hidden;
        }

        private void IsVisibleCb_Checked(object sender, RoutedEventArgs e)
        {
            
        }

        private void OkBtn_Click(object sender, RoutedEventArgs e)
        {

        }

        private void CancelBtn_Click(object sender, RoutedEventArgs e)
        {

        }

        private void ChangePasswordCb_Checked(object sender, RoutedEventArgs e)
        {
             PasswordGrid.Visibility = Visibility.Visible;
        }

        private void ChangePasswordCb_Unchecked(object sender, RoutedEventArgs e)
        {
            PasswordGrid.Visibility = Visibility.Hidden;
        }
    }
}
