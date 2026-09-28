using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.AccessControl;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Media;

namespace chudoShoes.ViewModels
{
    public class ProductViewModel
    {
        public ProductViewModel(Product product)
        {
            Id=product.Id;
            Name=product.Name;
            Description=product.Description;
            Material=product.Material;
            Cost=product.Cost;
            Photo=product.Photo;
            Manufacturer=product.Manufacturer;
            StockItem=product.StockItem;
            Subcategory=product.Subcategory;
            GetPhoto();
            GetBackground();
            GetStock();
        }
        public int Id { get; set; }
        public string Name { get; set; }

        public string Description { get; set; }
        public string Material { get; set; }
        public decimal Cost { get; set; }
        public string Photo { get; set; }

        public  Manufacturer Manufacturer { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public  ICollection<StockItem> StockItem { get; set; }
        public  Subcategory Subcategory { get; set; }
        public int TotalQuantity => StockItem?.Sum(s => s.AviableQuantity) ?? 0;
        public Brush Background { get; set; }
        public string StrQuantity {  get; set; }

        private void GetBackground()
        {
             if (TotalQuantity<= 3)
            {
                Background = Brushes.IndianRed;
            }
        }
        private void GetPhoto()
        {
            if (!string.IsNullOrEmpty(Photo)|| Photo =="")
                { return; }
            Photo = "/Res/picture.png";
        }
        private void GetStock()
        {
          
            if (TotalQuantity > 5)
            {
                StrQuantity = "много";
                return;
            }
            else if (TotalQuantity <= 5)
            {
                StrQuantity = "мало";
                return;
            }


        }
    }
}
