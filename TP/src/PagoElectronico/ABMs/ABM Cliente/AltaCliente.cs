﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using PagoElectronico.Utilidades.ModeloSistema;

namespace PagoElectronico.ABMs.ABM_Cliente
{
    public partial class AltaCliente : Form
    {
        public AltaCliente()
        {
            InitializeComponent();
            DataTable tiposDoc = GestorDeSistema.obtenerTiposDoc();
            TipoDcomboBox.DisplayMember = "Documento_Tipo_Descripcion";
            TipoDcomboBox.ValueMember = "Documento_Tipo_Codigo";
            TipoDcomboBox.DataSource = tiposDoc;

            DataTable paises = GestorDeSistema.obtenerPaises();
            PaiscomboBox.DisplayMember = "Pais_Descripcion";
            PaiscomboBox.ValueMember = "Pais_Cod";
            PaiscomboBox.DataSource = paises;
         }

        private void Crearbutton_Click(object sender, EventArgs e)
        {     
        }

        private void VolverButton_Click(object sender, EventArgs e)
        {
            Owner.Show();
            this.Hide();

        }

        private void CrearClienteBtn_Click(object sender, EventArgs e)
        {

            

            if (NroDocClitextBox.Text == "")
            {
                MessageBox.Show("Es obligatorio Insertar el Nro de Documento", "Advertencia", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
    
                return;
            }

            GestorDeSistema.crearCliente(NombreClitextBox.Text, ApellidoNuevoClitextBox.Text, Convert.ToInt32(TipoDcomboBox.SelectedValue.ToString()),
                                         Convert.ToInt32(NroDocClitextBox.Text), MailtextBox.Text, Convert.ToInt32(PaiscomboBox.SelectedValue.ToString()), DomicilioCalletextBox.Text,
                                         DomNumerotextBox.Text, DomicilioPisoTextBox.Text, DomicilioDeptotextBox.Text,
                                         LocalidadtextBox.Text, NacionalidadtextBox.Text, fechaNacimientodateTimePicker.Value);
            Owner.Show();
            this.Hide();
        }

    

   
    }

  

}