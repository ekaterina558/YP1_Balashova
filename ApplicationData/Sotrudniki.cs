//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace YP1_Balashova.ApplicationData
{
    using System;
    using System.Collections.Generic;
    
    public partial class Sotrudniki
    {
        public int ID { get; set; }
        public string surname { get; set; }
        public string name { get; set; }
        public string otchestvo { get; set; }
        public string Dolznost { get; set; }
        public string Status { get; set; }
        public int IDSmena { get; set; }
        public int IDZakaz { get; set; }
    
        public virtual Smena Smena { get; set; }
        public virtual Zakaz Zakaz { get; set; }
    }
}
