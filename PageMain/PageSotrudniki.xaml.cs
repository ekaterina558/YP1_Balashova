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
    /// Логика взаимодействия для PageSotrudniki.xaml
    /// </summary>
    public partial class PageSotrudniki : Page
    {
        public PageSotrudniki()
        {
            InitializeComponent();
            DtGridTovar.ItemsSource = AvtoMasterskyaEntities.GetContext().Sotrudniki.ToList();
        }

        private void Page_IsVisibleChanged(object sender, DependencyPropertyChangedEventArgs e)
        {
            AvtoMasterskyaEntities.GetContext().ChangeTracker.Entries().ToList().ForEach(p => p.Reload());
            DtGridTovar.ItemsSource = AvtoMasterskyaEntities.GetContext().Sotrudniki.ToList();
        }

        private void BtnDel_Click_1(object sender, RoutedEventArgs e)
        {
            var tovarForRemoving = DtGridTovar.SelectedItems.Cast<Sotrudniki>().ToList();
            if (MessageBox.Show($"Вы точно хотите удалить следующее {tovarForRemoving.Count()} элементов?", "Внимание",
                MessageBoxButton.YesNo, MessageBoxImage.Question) == MessageBoxResult.Yes)
            {
                try
                {
                    AvtoMasterskyaEntities.GetContext().Sotrudniki.RemoveRange(tovarForRemoving);
                    AvtoMasterskyaEntities.GetContext().SaveChanges();
                    MessageBox.Show("Данные удалены");

                    DtGridTovar.ItemsSource = AvtoMasterskyaEntities.GetContext().Sotrudniki.ToList();
                }
                catch (Exception Ex)
                {
                    MessageBox.Show(Ex.Message.ToString());
                }
            }
        }

        private void BtnAdd_Click_1(object sender, RoutedEventArgs e)
        {
            AppFrame.FrameMain.Navigate(new PageSotrudnikiAdd(null));
        }
    }
}
