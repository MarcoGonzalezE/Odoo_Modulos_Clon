#!/bin/bash
#-----------------------------------------------------------#
# Script para la clonacion de repositos de Odoo al servidor #
# y eliminacion de carpetas basura que no se requieran.     #
# Autor: Marco Antonio González                             #
#-----------------------------------------------------------#

##fixed parameters
OE_USER="administrator"
PASS="OFBIM"

Destino="/odoo/custom/addons"

URL1="https://github.com/ivanporras/Odoo_warehouse_stock_logistic.git"
URL2="https://github.com/ivanporras/Odoo_MassEditing.git"
URL3="https://github.com/ivanporras/Odoo_MRP"
#URL4="https://github.com/ivanporras/Odoo_reports.git"
URL5="https://github.com/ivanporras/Odoo_account_payment.git"
URL6="https://github.com/ivanporras/Odoo_acccount_invoicing.git"
URL7="https://github.com/ivanporras/Odoo_account_financial.git"
URL8="https://github.com/ivanporras/Odoo_sales.git"
URL9="https://github.com/ivanporras/Odoo_purchase.git"
URL10="https://github.com/ivanporras/Odoo_PLM.git"

echo "Introduzca contraseña de SUDO:"
read pass

#--------Instalacion SSHPASS--------
#echo " --- Instalando SSHPASS ---"
#sudo apt-get install sshpass
#clear

#-----Conexion servidor Avicampo----
#echo " ---Conexion a Servidor AVICAMPOSERVER---"
#sshpass -p $PASS ssh $OE_USER@192.168.10.6
#echo


#--------DESTINO---------------------
cd $Destino
echo " --- Ingresando a" $Destino


#------Clonar repositos Git----------
echo " --- Clonacion de repositos ---"


#----------URL 1-------------------
git clone $URL1
cd Odoo_warehouse_stock_logistic
mv product_warehouse_quantity $Destino
cd oca_stock_logistics_workflow 
mv stock_disable_force_availability_button $Destino
cd ..
cd ..
echo $pass | sudo -S rm -R Odoo_warehouse_stock_logistic 


#----------URL 2-------------------
git clone $URL2
cd Odoo_MassEditing
mv mass_editing $Destino
cd ..
sudo rm -R Odoo_MassEditing


#----------URL 3-------------------
git clone $URL3
cd Odoo_MRP
mv bom_cost_price_update $Destino
cd OCA_manufacture
mv product_quick_bom $Destino
cd ..
cd ..
sudo rm -R Odoo_MRP



#---------URL 4-------------------------
#git clone $URL4
#cd Odoo_reports


#---------URL 5-------------------------
git clone $URL5
cd Odoo_account_payment
mv total_payable_receivable $Destino
cd oca_reporting_engine
mv report_wkhtmltopdf_param $Destino
cd ..
cd oca_account_payment
mv account_check_printing_report_base $Destino
mv account_payment_show_invoice $Destino
mv account_partner_reconcile $Destino
mv account_payment_return $Destino
cd ..
cd ..
sudo rm -R Odoo_account_payment


#---------URL 6---------------------------
git clone $URL6
cd Odoo_acccount_invoicing
cd oca_account_invoicing
mv account_invoice_view_payment $Destino
mv account_invoice_supplier_ref_unique $Destino
cd ..
cd ..
sudo rm -R Odoo_acccount_invoicing


#---------URL 7-------------------------
git clone $URL7
cd Odoo_account_financial
cd oca_account_financial_tools
mv account_check_deposit $Destino
cd ..
cd ..
sudo rm -R Odoo_account_financial


#----------URL 8-----------------------
git clone $URL8
cd Odoo_sales
cd Sales_Avicampo
mv sale_order_avicampo $Destino
cd ..
cd OCA_Sales_Workflow
mv sale_procurement_group_by_line $Destino
mv sale_sourced_by_line $Destino
mv sale_exception $Destino
cd ..
mv sale_amendment $Destino
mv sales_order_history $Destino
mv sale_restrict $Destino
mv sale_customer_credit_limit $Destino
cd ..
sudo rm -R Odoo_sales


#----------URL 9----------------------
git clone $URL9
cd Odoo_purchase
cd OCA_Purchase_Workflow
mv purchase_request_to_procurement $Destino
mv purchase_location_by_line $Destino
mv purchase_delivery_split_date $Destino
cd ..
mv purchase_history $Destino
mv purchase_amendment $Destino
mv acs_product_purchase_history $Destino
cd ..
sudo rm -R Odoo_purchase


#---------URL 10---------------------
git clone $URL10
cd Odoo_PLM
mv plm $Destino
mv plm_auto_internalref $Destino
mv plm_automate_normal_bom $Destino
mv plm_compare_bom $Destino
mv plm_cutted_parts $Destino
mv plm_date_bom $Destino
mv plm_engineering $Destino
mv plm_pack_and_go $Destino
mv plm_sale_fix $Destino
mv plm_spare $Destino
cd ..
sudo rm -R Odoo_PLM



echo " --- Clonados y basura eliminada --- "

