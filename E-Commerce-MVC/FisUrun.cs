//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DBMS
{
    using System;
    using System.Collections.Generic;
    
    public partial class FisUrun
    {
        public int FisID { get; set; }
        public int BarkodNo { get; set; }
        public int Miktar { get; set; }
        public bool IadeDurumu { get; set; }
        public string Yorum { get; set; }
        public string Resim { get; set; }
        public int FisUrunID { get; set; }
    
        public virtual Fis Fis { get; set; }
        public virtual Urun Urun { get; set; }
    }
}
