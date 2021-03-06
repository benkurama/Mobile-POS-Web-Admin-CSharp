﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using libPOS.DAL;

namespace libPOS.BLL
{
    public class Inventory
    {
        public int InventoryID { get; set; }
        public int KioskID { get; set; }
        public int ProdID { get; set; }
        public int StockIn { get; set; }
        public int StockOut { get; set; }
        public string Active { get; set; }
        public DateTime? InsertDate { get; set; }

        public string ProdName_ { get; set; }
        public int StockDiff_ { get; set; }
        public decimal PriceDiscount_ { get; set; }
        public decimal Price_ { get; set; }
        public int InsuficienIMEI_ { get; set; }

        public Inventory()
        {
            this.InventoryID = 0;
            this.KioskID = 0;
            this.ProdID = 0;
            this.StockIn = 0;
            this.StockOut = 0;
            this.Active = "";
            this.InsertDate = null;

            this.ProdName_ = "";
            this.StockDiff_ = 0;
            this.PriceDiscount_ = 0;
            this.Price_ = 0;
            this.InsuficienIMEI_ = 0;
        }

        public void Bind(DataRow row)
        {
            if(row != null){
                this.InventoryID = Utils.convInt("InventoryID", row);
                this.KioskID = Utils.convInt("KioskID", row);
                this.ProdID = Utils.convInt("ProdID", row);
                this.StockIn = Utils.convInt("StockIn", row);
                this.StockOut = Utils.convInt("StockOut", row);
                this.Active = Utils.convString("Active", row);
                this.InsertDate = Utils.convDateTime("InsertDate", row);

                this.ProdName_ = Utils.convString("ProdName", row);
                this.StockDiff_ = StockIn - StockOut;
                this.PriceDiscount_ = Utils.convDecimal("DiscountPrice", row);
                this.Price_ = Utils.convDecimal("Price", row);

                this.InsuficienIMEI_ = Utils.convInt("InsuficientIMEI", row);
            }
        }

        public static List<Inventory> GetAllByKiosk(int id)
        {
            var dal = new InventoryDAL();
            var collection = new List<Inventory>();

            foreach (DataRow row in dal.GetAllByKiosk(id).Rows)
            {
                var instance = new Inventory();
                instance.Bind(row);
                collection.Add(instance);
            }

            return collection;
        }

        public static void UpdateActiveStatus(string active, int InvID)
        {
            var dal = new InventoryDAL();

            dal.UpdateActiveStatus(active, InvID);
        }

        public static Inventory GetSelectedInventory(int invid)
        {
            var dal = new InventoryDAL();
            var ins = new Inventory();

            DataTable dt = dal.GetSelectedInventory(invid);
            DataRow row = dt.Rows[0];

            ins.Bind(row);

            return ins;
        }
    }
}
