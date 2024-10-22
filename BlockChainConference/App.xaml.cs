using BlockChainConference.Model;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using System.Windows;

namespace BlockChainConference
{
    /// <summary>
    /// Логика взаимодействия для App.xaml
    /// </summary>
    public partial class App : Application
    {
        private static ConferenceEntities _context;
        public static ConferenceEntities GetContext()
        {
            if (_context == null)
            {
                _context = new ConferenceEntities();
            }
            return _context;
        }
    }
}
