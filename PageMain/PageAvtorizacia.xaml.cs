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
    /// Логика взаимодействия для PageAvtorizacia.xaml
    /// </summary>
    public partial class PageAvtorizacia : Page
    {
        public PageAvtorizacia()
        {
            InitializeComponent();
        }

        private void BtnIn_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                var userObj = AvtoMasterskyaEntities.GetContext().User.FirstOrDefault(x => x.login == txbLogin.Text && x.password == psbPassword.Password);
                if (userObj == null)
                {
                    MessageBox.Show("Такого пользователя нет!", "Ошибка авторизации!", MessageBoxButton.OK, MessageBoxImage.Error);
                }
                else
                {
                    switch (userObj.IDRole)
                    {
                        case 1:
                            MessageBox.Show("Здравствуйте, мастер приемщик" + userObj.name + "!", "Уведомление", MessageBoxButton.OK, MessageBoxImage.Information);
                            AppFrame.FrameMain.Navigate(new PageSotrudniki());
                            break;

                        case 2:
                            MessageBox.Show("Здравствуйте,автодиагност" + userObj.name + "!", "Уведомление", MessageBoxButton.OK, MessageBoxImage.Information);
                            AppFrame.FrameMain.Navigate(new PageSmena());
                            AppFrame.FrameMain.Navigate(new PageZakaz());
                            break;

                    }
                }

            }
            catch (Exception Ex)
            {

                MessageBox.Show("Ошибка" + Ex.Message.ToString() + "Критическая ошибка приложения!", "Уведомление", MessageBoxButton.OK, MessageBoxImage.Warning);

            }
        }
    }
}
