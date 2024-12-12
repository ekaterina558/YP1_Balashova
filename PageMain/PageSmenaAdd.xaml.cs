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
using System.Windows.Navigation;
using System.Windows.Shapes;
using YP1_Balashova.ApplicationData;

namespace YP1_Balashova.PageMain
{
    /// <summary>
    /// Логика взаимодействия для PageSmenaAdd.xaml
    /// </summary>
    public partial class PageSmenaAdd : Page
    {
        private Smena _currentSmena = new Smena();
        public PageSmenaAdd(Smena selectedSmena)
        {
            InitializeComponent();
            if (selectedSmena != null)
                _currentSmena = selectedSmena;
            DataContext = _currentSmena;
        }

        private void BtnSave_Click(object sender, RoutedEventArgs e)
        {
            StringBuilder err0rs = new StringBuilder();

            if (string.IsNullOrWhiteSpace(_currentSmena.naimenov))
                err0rs.AppendLine("Укажите название смены");

            if (err0rs.Length > 0)
            {
                MessageBox.Show(err0rs.ToString());
                return;
            }
            //добавление
            if (_currentSmena.ID == 0)
                AvtoMasterskyaEntities.GetContext().Smena.Add(_currentSmena);

            //обработка вариант выпада/записи данных
            try
            {
                AvtoMasterskyaEntities.GetContext().SaveChanges();
                MessageBox.Show("Информация сохранена");
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message.ToString());
            }
        }
    }
}
