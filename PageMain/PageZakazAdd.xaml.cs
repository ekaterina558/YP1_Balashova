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
    /// Логика взаимодействия для PageZakazAdd.xaml
    /// </summary>
    public partial class PageZakazAdd : Page
    {
        private Zakaz _currentZakaz = new Zakaz();
        public PageZakazAdd(Zakaz selectedZakaz)
        {
            InitializeComponent();
            if (selectedZakaz != null)
                _currentZakaz = selectedZakaz;
            DataContext = _currentZakaz;
        }

        private void BtnSave_Click(object sender, RoutedEventArgs e)
        {
            StringBuilder err0rs = new StringBuilder();

            if (string.IsNullOrWhiteSpace(_currentZakaz.naimenov))
                err0rs.AppendLine("Укажите название товара");
            if (_currentZakaz.kolichestvo <= 0)
                err0rs.AppendLine("Количество товара не может быть меньше или равно 0");
            if (_currentZakaz.cena <= 0)
                err0rs.AppendLine("Цена не может быть меньше или равно 0");
            
            if (err0rs.Length > 0)
            {
                MessageBox.Show(err0rs.ToString());
                return;
            }
            //добавление
            if (_currentZakaz.ID == 0)
                AvtoMasterskyaEntities.GetContext().Zakaz.Add(_currentZakaz);

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
