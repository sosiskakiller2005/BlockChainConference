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

namespace BlockChainConference.Views.OrganizerWindows
{
    /// <summary>
    /// Логика взаимодействия для NewEventWindow.xaml
    /// </summary>
    public partial class NewEventWindow : Window
    {
        private Organizer _selectedOrganizer;
        static StackPanel stackPanels = new StackPanel() {};
        private static ConferenceEntities _context = App.GetContext();
        public NewEventWindow(Organizer selectedOrganizer)
        {
            InitializeComponent();
            CreateRows();
            JuryGrid.Children.Add(stackPanels);
        }
        private static StackPanel AddRow()
        {
            StackPanel newRow = new StackPanel() { Name = "Row" + stackPanels.Children.Count, Orientation = Orientation.Horizontal };
            newRow.Children.Add(new TextBox() { Name = "EventName" + stackPanels.Children.Count });
            newRow.Children.Add(new Border() { Width = 10 });
            newRow.Children.Add(new ComboBox()
            {
                Name = "JuryCmb" + stackPanels.Children.Count,
                ItemsSource = _context.Jury.ToList(),
                DisplayMemberPath = "Name"
            });
            return newRow;
        }

        private static void CreateRows()
        {
            StackPanel newRow1 = new StackPanel() { Name = "Row1", Orientation = Orientation.Horizontal };
            newRow1.Children.Add(new TextBox() { Name = "EventName1"});
            newRow1.Children.Add(new Border() { Width = 20 });
            newRow1.Children.Add(new ComboBox()
            {
                Name = "JuryCmb1",
                ItemsSource = _context.Jury.ToList(),
                DisplayMemberPath = "Email"
            });
            stackPanels.Children.Add(newRow1);
            stackPanels.Children.Add(new Border() { Height = 20 });

            StackPanel newRow2 = new StackPanel() { Name = "Row2", Orientation = Orientation.Horizontal };
            newRow2.Children.Add(new TextBox() { Name = "EventName2"});
            newRow2.Children.Add(new Border() { Width = 20 });
            newRow2.Children.Add(new ComboBox()
            {
                Name = "JuryCmb2",
                ItemsSource = _context.Jury.ToList(),
                DisplayMemberPath = "Email"
            });
            stackPanels.Children.Add(newRow2);
            stackPanels.Children.Add(new Border() { Height = 20 });

            StackPanel newRow3 = new StackPanel() { Name = "Row3", Orientation = Orientation.Horizontal };
            newRow2.Children.Add(new TextBox() { Name = "EventName3"});
            newRow2.Children.Add(new Border() { Width = 20 });
            newRow2.Children.Add(new ComboBox()
            {
                Name = "JuryCmb3",
                ItemsSource = _context.Jury.ToList(),
                DisplayMemberPath = "Email"
            });
            stackPanels.Children.Add(newRow3);
            stackPanels.Children.Add(new Border() { Height = 20 });
        }
    }
}
