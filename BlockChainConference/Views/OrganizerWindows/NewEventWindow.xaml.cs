﻿using BlockChainConference.AppData;
using BlockChainConference.Model;
using BlockChainConference.Views.Windows;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
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
            _selectedOrganizer = selectedOrganizer;

            JuryCmb1.ItemsSource = _context.Jury.ToList();
            JuryCmb1.DisplayMemberPath = "Email";
            JuryCmb2.ItemsSource = _context.Jury.ToList();
            JuryCmb2.DisplayMemberPath = "Email";
            JuryCmb3.ItemsSource = _context.Jury.ToList();
            JuryCmb3.DisplayMemberPath = "Email";

            CityCmb.ItemsSource = _context.City.ToList();
            CityCmb.DisplayMemberPath = "Name";
            DirectionCmb.ItemsSource = _context.Direction.ToList();
            DirectionCmb.DisplayMemberPath = "Name";
        }
        /// <summary>
        /// Добавляет одну строку активности.
        /// </summary>
        /// <returns></returns>
        private static StackPanel AddRow()
        {
            StackPanel newRow = new StackPanel() { Name = "Row" + stackPanels.Children.Count, Orientation = Orientation.Horizontal };
            newRow.Children.Add(new TextBox() { Name = "EventName" + stackPanels.Children.Count });
            newRow.Children.Add(new Border() { Width = 20 });
            newRow.Children.Add(new ComboBox()
            {
                Name = "JuryCmb" + stackPanels.Children.Count,
                ItemsSource = _context.Jury.ToList(),
                DisplayMemberPath = "Email"
            });
            newRow.Children.Add(new Border() { Height = 20 });
            return newRow;
        }


        private void AddRowBtn_Click(object sender, RoutedEventArgs e)
        {
            JuryGrid.Children.Add(AddRow());
            JuryGrid.Children.Add(new Border() { Height = 20 });
            UpdateButtons();
        }

        private void DeleteROwBtn_Click(object sender, RoutedEventArgs e)
        {
            int lastElementId = JuryGrid.Children.Count -1;
            JuryGrid.Children.RemoveAt(lastElementId);
            JuryGrid.Children.RemoveAt(lastElementId - 1);
            UpdateButtons();
        }

        /// <summary>
        /// Обновляет доступность кнопок удаление и добавления активности.
        /// </summary>
        private void UpdateButtons()
        {
            int childrenCount = JuryGrid.Children.Count;
            if (childrenCount > 14)
            {
                AddRowBtn.Visibility = Visibility.Collapsed;
            }
            else if (childrenCount < 16)
            {
                AddRowBtn.Visibility = Visibility.Visible;
            }
            if (childrenCount > 6)
            {
                DeleteROwBtn.Visibility = Visibility.Visible;
            }
            else if (childrenCount < 8)
            {
                DeleteROwBtn.Visibility = Visibility.Collapsed;
            }
        }

        private void OkBtn_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                Event newEvent = new Event()
                {
                    Name = EventNameTb.Text,
                    Date = (DateTime)EventDateDp.SelectedDate,
                    Direction = DirectionCmb.SelectedItem as Direction,
                    City = CityCmb.SelectedItem as City,
                    Days = Convert.ToInt32(DaysTb.Text),
                    Organizer = _selectedOrganizer

                };
                _context.Event.Add(newEvent);

                //Добавление всех строк активностей в массив.
                List<StackPanel> rows = new List<StackPanel>();
                for (int i = 0; i < JuryGrid.Children.Count; i++)
                {
                    if (i == 0 || i %2 == 0)
                    {
                        rows.Add((StackPanel)JuryGrid.Children[i]);
                    }
                }
                //Формирование Activity из каждой строки.
                for (int i = 0; i < rows.Count; i++)
                {
                    Activity newActivity = new Activity()
                    {
                        Name = (rows[i].Children[0] as TextBox).Text,
                        Jury = (rows[i].Children[2] as ComboBox).SelectedItem as Jury,
                        Event = newEvent,
                    };
                    _context.Activity.Add(newActivity);
                }
                _context.SaveChanges();
                MessageBoxHelper.Information("Мероприятие добавлено.");
                DialogResult = true;
                Close();
            }
            catch (InvalidOperationException)
            {
                MessageBoxHelper.Error("Заполните все поля для ввода.");
            }
        }

        private void DaysTb_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            e.Handled = !IsTextAllowed(e.Text);
        }
        private static readonly Regex _regex = new Regex("[^0-9.-]+"); //regex that matches disallowed text
        private static bool IsTextAllowed(string text)
        {
            return !_regex.IsMatch(text);
        }

        private void KanbanBtn_Click(object sender, RoutedEventArgs e)
        {
            KanbanWindow kanbanWindow = new KanbanWindow();
            kanbanWindow.ShowDialog();
        }
    }
}
