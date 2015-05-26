﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using PagoElectronico.Utilidades.ModeloSistema;

namespace PagoElectronico.Operaciones.Depositos
{
    public partial class DepositosPrincipal : Form
    {
        public DepositosPrincipal(string username)
        {
            InitializeComponent();
            string usuario = username;
            DataTable cuenta = GestorDeSistema.obtenerCuentasDeUsuario(usuario);
            cmbCuenta.DisplayMember = "Cuenta_Numero";
            cmbCuenta.ValueMember = "Cuenta_Numero";
            cmbCuenta.DataSource = cuenta;

            DataTable moneda = GestorDeSistema.obtenerMonedas();
            cmbMoneda.DisplayMember = "Moneda_Descripcion";
            cmbMoneda.ValueMember = "Moneda_Descripcion";
            cmbMoneda.DataSource = moneda;

            DataTable tarjeta = GestorDeSistema.obtenerTarjetasUsuario(usuario);
            cmbTarjeta.DisplayMember = "Tarjeta_Numero";
            cmbTarjeta.ValueMember = "Tarjeta_Numero";
            cmbTarjeta.DataSource = tarjeta;
        }

        private void DepositosPrincipal_Load(object sender, EventArgs e)
        {

        }

        private void btnVolver_Click(object sender, EventArgs e)
        {
            Owner.Show();
            this.Hide();
        }



        //Validaciones

        private void ImporteTextBox_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!(char.IsNumber(e.KeyChar)) && (e.KeyChar != (char)Keys.Back))
            {
                MessageBox.Show("El campo 'Importe' sólo puede contener números", "Problema de ingreso de datos", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                e.Handled = true;
                return;

            }
        }
    }
}