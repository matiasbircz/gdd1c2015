﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

using PagoElectronico.Utilidades.ModeloSistema;

namespace PagoElectronico.ABMs.ABM_Cuenta
{
    public partial class ABMCuentaPrincipal : Form
    {
        int rolCod;
        string username, clienteID;
        

        public ABMCuentaPrincipal(int rolCodP, string usernameP)
        {
            InitializeComponent();
            rolCod = rolCodP;
            username = usernameP;

            if (rolCod != 2)
            {
                lblClienteID.Enabled = true;
                txtClienteID.Enabled = true;
                lblCuentaNumero.Enabled = true;
                txtBuscarCuentaNumero.Enabled = true;
            }
            else
            {
                clienteID = GestorDeSistema.obtenerNumeroCliente(username).ToString();
                if (clienteID == "-1")
                {
                    System.Windows.Forms.MessageBox.Show("No posee datos de Cliente asociados, por favor consulte a un administrador.");
                    txtClienteID.Text = "NO POSEE";
                    btnNuevaCuenta.Enabled = false;
                }
                else
                {
                    txtClienteID.Text = clienteID;
                }
             
            }
        }

        private void btnVolver_Click(object sender, EventArgs e)
        {
            Owner.Show();
            this.Hide();
        }

        private void btnBuscarCuenta_Click(object sender, EventArgs e)
        {
            bool validacionCorrecta = validaciones();
            if(validacionCorrecta == true)
            {
                dgvCuenta.Rows.Clear();
                string cuentaABuscar = txtBuscarCuentaNumero.Text;
                string clienteABuscar = txtClienteID.Text;
                DataTable cuentasEncontradas = GestorDeSistema.obtenerDatosCuenta(cuentaABuscar, clienteABuscar);
                if (cuentasEncontradas.Rows.Count > 0)
                {
                    foreach (DataRow usuarioEncontrado in cuentasEncontradas.Rows)
                    {
                        dgvCuenta.Rows.Add(usuarioEncontrado.ItemArray[0],
                                             usuarioEncontrado.ItemArray[1],
                                             usuarioEncontrado.ItemArray[2].ToString(),
                                             usuarioEncontrado.ItemArray[3].ToString(),
                                             usuarioEncontrado.ItemArray[4],
                                             usuarioEncontrado.ItemArray[5],
                                             usuarioEncontrado.ItemArray[6],
                                             usuarioEncontrado.ItemArray[7],
                                             usuarioEncontrado.ItemArray[8],
                                             usuarioEncontrado.ItemArray[9],
                                             usuarioEncontrado.ItemArray[10],
                                             "Modificar",
                                             "Inhabilitar",
                                             "Cerrar");
                    }
                    dgvCuenta.Update();
                }
                else
                {
                    System.Windows.Forms.MessageBox.Show("No se encontraron cuentas con los datos proporcionados");
                }
            }
            }


        private void btnLimpiarBusqueda_Click(object sender, EventArgs e)
        {
            dgvCuenta.Rows.Clear();
        }

        private void btnNuevaCuenta_Click(object sender, EventArgs e)
        {
            AltaCuenta nuevaCuenta = new AltaCuenta(rolCod, clienteID);
            this.Hide();
            nuevaCuenta.ShowDialog(this);
            btnBuscarCuenta.PerformClick();
        }

        private void dgvCuenta_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            int numeroClienteAModificar = Convert.ToInt32(dgvCuenta.Rows[e.RowIndex].Cells["Cuenta_Cliente_ID"].Value.ToString());
            long numeroCuentaAModificar = Convert.ToInt64(dgvCuenta.Rows[e.RowIndex].Cells["Cuenta_Numero"].Value.ToString());
            
            if (e.ColumnIndex == 11)
            {
                if (GestorDeSistema.estadoCuenta(numeroClienteAModificar, numeroCuentaAModificar) != 3)
                {
                    string paisAModificar = dgvCuenta.Rows[e.RowIndex].Cells["Cuenta_Pais"].Value.ToString();
                    string monedaAModificar = dgvCuenta.Rows[e.RowIndex].Cells["Cuenta_Moneda"].Value.ToString();
                    string tipoCuentaAModificar = dgvCuenta.Rows[e.RowIndex].Cells["Cuenta_Tipo"].Value.ToString();
                    ModificacionCuenta frmModificacionCuenta = new ModificacionCuenta(numeroCuentaAModificar, numeroClienteAModificar, paisAModificar, monedaAModificar, tipoCuentaAModificar);
                    this.Hide();
                    frmModificacionCuenta.ShowDialog(this);
                    btnBuscarCuenta.PerformClick();
                }
                else
                {
                    System.Windows.Forms.MessageBox.Show("No puede modificar una cuenta que ya esta cerrada.", "Error");
                }

            }
            if (e.ColumnIndex == 12)
            {

                if (GestorDeSistema.estadoCuenta(numeroClienteAModificar, numeroCuentaAModificar) != 3)
                {
                    if (rolCod == 1)
                    {
                        GestorDeSistema.inhabilitarCuenta(numeroClienteAModificar, numeroCuentaAModificar);
                        System.Windows.Forms.MessageBox.Show("La cuenta ha sido Inhabilitada correctamente");
                    }
                    else
                    {
                        System.Windows.Forms.MessageBox.Show("Para inhabilitar su cuenta, consulte a un Administrador");

                    }
                }
                else
                {
                    System.Windows.Forms.MessageBox.Show("No puede inhabilitar una cuenta que ya esta cerrada.", "Error");

                }

                
            }
            if (e.ColumnIndex == 13)
            {
                if (GestorDeSistema.estadoCuenta(numeroClienteAModificar, numeroCuentaAModificar) != 3)
                {
                    int operacionesPendientesDePagar = GestorDeSistema.obtenerOperacionesSinFacturar(numeroClienteAModificar, numeroCuentaAModificar);
                    if (operacionesPendientesDePagar == 0)
                    {
                        GestorDeSistema.cerrarCuenta(numeroClienteAModificar, numeroCuentaAModificar);
                        System.Windows.Forms.MessageBox.Show("La cuenta ha sido Cerrada correctamente");
                        btnBuscarCuenta.PerformClick();
                    }
                    else
                    {
                        System.Windows.Forms.MessageBox.Show("No se pudo cerrar la Cuenta. Posee operaciones sin pagar. Consulte sección Facturación.", "Error");
                    }
                }
                else
                {
                    System.Windows.Forms.MessageBox.Show("No puede cerrar una cuenta que ya esta cerrada.", "Error");

                }

            }
        }
        
        private void txtBuscarCuentaNumero_KeyPress(object sender, KeyPressEventArgs e)
        {

            if (Convert.ToInt32(e.KeyChar) == 13)
            {
                btnBuscarCuenta.PerformClick();
            }
        }

        private void txtClienteID_KeyPress(object sender, KeyPressEventArgs e)
        {

            if (Convert.ToInt32(e.KeyChar) == 13)
            {
                btnBuscarCuenta.PerformClick();
            }
        }

        //VALIDACIONES

        private bool validaciones()
        {
            string valorNumeroCuenta = txtBuscarCuentaNumero.Text;
            string valorClienteID = txtClienteID.Text;
            long verificacion = 0;
            bool canConvert = long.TryParse(valorNumeroCuenta, out verificacion);
            if (canConvert != true && valorNumeroCuenta != "")
            { 
                MessageBox.Show("El campo 'Número de Cuenta' sólo puede contener números", "Problema de ingreso de datos", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                return false;
            }
            canConvert = long.TryParse(valorClienteID, out verificacion);
            if (canConvert != true && valorClienteID != "")
            {
                MessageBox.Show("El campo 'Cliente ID' sólo puede contener números", "Problema de ingreso de datos", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                return false;
            }

            return true;

                
                
        }
        
       

    }
}
