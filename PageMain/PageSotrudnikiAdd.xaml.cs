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
    /// Логика взаимодействия для PageSotrudnikiAdd.xaml
    /// </summary>
    public partial class PageSotrudnikiAdd : Page
    {   
        private Sotrudniki _currentSotrudniki = new Sotrudniki();
        public PageSotrudnikiAdd(Sotrudniki selectedSotrudniki)
        {
            InitializeComponent();
            if (selectedSotrudniki != null)
                _currentSotrudniki = selectedSotrudniki;
            DataContext = _currentSotrudniki;
            ComboDolznost.ItemsSource = AvtoMasterskyaEntities.GetContext().Sotrudniki.ToList();
            ComboStatus.ItemsSource = AvtoMasterskyaEntities.GetContext().Sotrudniki.ToList();

        }

        private void BtnSave_Click(object sender, RoutedEventArgs e)
        {
            StringBuilder err0rs = new StringBuilder();

            if (string.IsNullOrWhiteSpace(_currentSotrudniki.surname))
                err0rs.AppendLine("Укажите фамилию");
            if (string.IsNullOrWhiteSpace(_currentSotrudniki.name))
                err0rs.AppendLine("Укажите имя");
            if (string.IsNullOrWhiteSpace(_currentSotrudniki.otchestvo))
                err0rs.AppendLine("Укажите отчество");
            if (_currentSotrudniki.Dolznost == null)
                err0rs.AppendLine("Выберите размер");
            if (_currentSotrudniki.Status == null)
                err0rs.AppendLine("Выберите статус");


            if (err0rs.Length > 0)
            {
                MessageBox.Show(err0rs.ToString());
                return;
            }
            //добавление
            if (_currentSotrudniki.ID == 0)
                AvtoMasterskyaEntities.GetContext().Sotrudniki.Add(_currentSotrudniki);

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
