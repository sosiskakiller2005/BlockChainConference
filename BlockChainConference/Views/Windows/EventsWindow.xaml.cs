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
    /// Логика взаимодействия для EventsWindow.xaml
    /// </summary>
    public partial class EventsWindow : Window
    {
        private static ConferenceEntities _context = App.GetContext();
        List<Direction> directions = _context.Direction.ToList();
        List<Event> events = _context.Event.ToList();
        public EventsWindow()
        {
            InitializeComponent();
            EventsLb.ItemsSource = _context.Event.ToList();
            directions.Insert(0, new Direction(Name = "Все направления"));
            DirectionCmb.ItemsSource = directions;
            DirectionCmb.DisplayMemberPath = "Name";
        }

        private void EventsLv_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {

        }

        private void DirectionCmb_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (DirectionCmb.SelectedIndex == 0)
            {
                events = _context.Event.ToList();
            }
            else
            {
                events = events.Where(ev => ev.Direction == DirectionCmb.SelectedItem).ToList();
            }
        }

        private void SignInHL_Click(object sender, RoutedEventArgs e)
        {
            AuthorisationWindow authorisationWindow = new AuthorisationWindow();
            authorisationWindow.Show();
            Close();
        }
    }
}
