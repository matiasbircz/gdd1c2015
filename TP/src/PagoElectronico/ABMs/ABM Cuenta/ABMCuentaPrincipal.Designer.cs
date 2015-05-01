﻿namespace PagoElectronico.ABMs.ABM_Cuenta
{
    partial class ABMCuentaPrincipal
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.btnNuevaCuenta = new System.Windows.Forms.Button();
            this.btnVolver = new System.Windows.Forms.Button();
            this.dgvCuenta = new System.Windows.Forms.DataGridView();
            this.panelBusqueda = new System.Windows.Forms.Panel();
            this.btnLimpiarBusqueda = new System.Windows.Forms.Button();
            this.txtBuscarCuentaNumero = new System.Windows.Forms.TextBox();
            this.btnBuscarCuenta = new System.Windows.Forms.Button();
            this.lblCuentaNumero = new System.Windows.Forms.Label();
            this.Cuenta_Numero = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Cuenta_Cliente_ID = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Cuenta_Fecha_Creacion = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Cuenta_Fecha_Cierre = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Cuenta_Saldo = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Cuenta_Tipo = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Cuenta_Estado = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Cuenta_Moneda = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Cuenta_Pais = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Modificar = new System.Windows.Forms.DataGridViewButtonColumn();
            this.Eliminar = new System.Windows.Forms.DataGridViewButtonColumn();
            this.Usuario_Habilitado = new System.Windows.Forms.DataGridViewCheckBoxColumn();
            this.lblClienteID = new System.Windows.Forms.Label();
            this.txtClienteID = new System.Windows.Forms.TextBox();
            ((System.ComponentModel.ISupportInitialize)(this.dgvCuenta)).BeginInit();
            this.panelBusqueda.SuspendLayout();
            this.SuspendLayout();
            // 
            // btnNuevaCuenta
            // 
            this.btnNuevaCuenta.Location = new System.Drawing.Point(392, 12);
            this.btnNuevaCuenta.Name = "btnNuevaCuenta";
            this.btnNuevaCuenta.Size = new System.Drawing.Size(324, 108);
            this.btnNuevaCuenta.TabIndex = 10;
            this.btnNuevaCuenta.Text = "Nueva Cuenta";
            this.btnNuevaCuenta.UseVisualStyleBackColor = true;
            // 
            // btnVolver
            // 
            this.btnVolver.Location = new System.Drawing.Point(596, 316);
            this.btnVolver.Name = "btnVolver";
            this.btnVolver.Size = new System.Drawing.Size(120, 23);
            this.btnVolver.TabIndex = 9;
            this.btnVolver.Text = "Volver";
            this.btnVolver.UseVisualStyleBackColor = true;
            this.btnVolver.Click += new System.EventHandler(this.btnVolver_Click);
            // 
            // dgvCuenta
            // 
            this.dgvCuenta.AllowUserToAddRows = false;
            this.dgvCuenta.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvCuenta.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.Cuenta_Numero,
            this.Cuenta_Cliente_ID,
            this.Cuenta_Fecha_Creacion,
            this.Cuenta_Fecha_Cierre,
            this.Cuenta_Saldo,
            this.Cuenta_Tipo,
            this.Cuenta_Estado,
            this.Cuenta_Moneda,
            this.Cuenta_Pais,
            this.Modificar,
            this.Eliminar,
            this.Usuario_Habilitado});
            this.dgvCuenta.Location = new System.Drawing.Point(12, 144);
            this.dgvCuenta.Name = "dgvCuenta";
            this.dgvCuenta.RowHeadersVisible = false;
            this.dgvCuenta.Size = new System.Drawing.Size(704, 150);
            this.dgvCuenta.TabIndex = 8;
            // 
            // panelBusqueda
            // 
            this.panelBusqueda.Controls.Add(this.txtClienteID);
            this.panelBusqueda.Controls.Add(this.lblClienteID);
            this.panelBusqueda.Controls.Add(this.btnLimpiarBusqueda);
            this.panelBusqueda.Controls.Add(this.txtBuscarCuentaNumero);
            this.panelBusqueda.Controls.Add(this.btnBuscarCuenta);
            this.panelBusqueda.Controls.Add(this.lblCuentaNumero);
            this.panelBusqueda.Location = new System.Drawing.Point(12, 12);
            this.panelBusqueda.Name = "panelBusqueda";
            this.panelBusqueda.Size = new System.Drawing.Size(346, 108);
            this.panelBusqueda.TabIndex = 7;
            // 
            // btnLimpiarBusqueda
            // 
            this.btnLimpiarBusqueda.Location = new System.Drawing.Point(225, 76);
            this.btnLimpiarBusqueda.Name = "btnLimpiarBusqueda";
            this.btnLimpiarBusqueda.Size = new System.Drawing.Size(107, 23);
            this.btnLimpiarBusqueda.TabIndex = 3;
            this.btnLimpiarBusqueda.Text = "Limpiar Búsqueda";
            this.btnLimpiarBusqueda.UseVisualStyleBackColor = true;
            // 
            // txtBuscarCuentaNumero
            // 
            this.txtBuscarCuentaNumero.Location = new System.Drawing.Point(122, 18);
            this.txtBuscarCuentaNumero.Name = "txtBuscarCuentaNumero";
            this.txtBuscarCuentaNumero.Size = new System.Drawing.Size(210, 20);
            this.txtBuscarCuentaNumero.TabIndex = 2;
            // 
            // btnBuscarCuenta
            // 
            this.btnBuscarCuenta.Location = new System.Drawing.Point(144, 76);
            this.btnBuscarCuenta.Name = "btnBuscarCuenta";
            this.btnBuscarCuenta.Size = new System.Drawing.Size(75, 23);
            this.btnBuscarCuenta.TabIndex = 1;
            this.btnBuscarCuenta.Text = "Buscar";
            this.btnBuscarCuenta.UseVisualStyleBackColor = true;
            // 
            // lblCuentaNumero
            // 
            this.lblCuentaNumero.AutoSize = true;
            this.lblCuentaNumero.Location = new System.Drawing.Point(17, 21);
            this.lblCuentaNumero.Name = "lblCuentaNumero";
            this.lblCuentaNumero.Size = new System.Drawing.Size(99, 13);
            this.lblCuentaNumero.TabIndex = 0;
            this.lblCuentaNumero.Text = "Numero de Cuenta:";
            // 
            // Cuenta_Numero
            // 
            this.Cuenta_Numero.HeaderText = "Numero de Cuenta";
            this.Cuenta_Numero.Name = "Cuenta_Numero";
            this.Cuenta_Numero.ReadOnly = true;
            // 
            // Cuenta_Cliente_ID
            // 
            this.Cuenta_Cliente_ID.HeaderText = "Cliente";
            this.Cuenta_Cliente_ID.Name = "Cuenta_Cliente_ID";
            this.Cuenta_Cliente_ID.ReadOnly = true;
            // 
            // Cuenta_Fecha_Creacion
            // 
            this.Cuenta_Fecha_Creacion.HeaderText = "Fecha_Creacion";
            this.Cuenta_Fecha_Creacion.Name = "Cuenta_Fecha_Creacion";
            this.Cuenta_Fecha_Creacion.ReadOnly = true;
            // 
            // Cuenta_Fecha_Cierre
            // 
            this.Cuenta_Fecha_Cierre.HeaderText = "Fecha_Cierre";
            this.Cuenta_Fecha_Cierre.Name = "Cuenta_Fecha_Cierre";
            this.Cuenta_Fecha_Cierre.ReadOnly = true;
            // 
            // Cuenta_Saldo
            // 
            this.Cuenta_Saldo.HeaderText = "Saldo";
            this.Cuenta_Saldo.Name = "Cuenta_Saldo";
            this.Cuenta_Saldo.ReadOnly = true;
            // 
            // Cuenta_Tipo
            // 
            this.Cuenta_Tipo.HeaderText = "Tipo";
            this.Cuenta_Tipo.Name = "Cuenta_Tipo";
            this.Cuenta_Tipo.ReadOnly = true;
            // 
            // Cuenta_Estado
            // 
            this.Cuenta_Estado.HeaderText = "Estado";
            this.Cuenta_Estado.Name = "Cuenta_Estado";
            this.Cuenta_Estado.ReadOnly = true;
            // 
            // Cuenta_Moneda
            // 
            this.Cuenta_Moneda.HeaderText = "Moneda";
            this.Cuenta_Moneda.Name = "Cuenta_Moneda";
            this.Cuenta_Moneda.ReadOnly = true;
            // 
            // Cuenta_Pais
            // 
            this.Cuenta_Pais.HeaderText = "Pais";
            this.Cuenta_Pais.Name = "Cuenta_Pais";
            this.Cuenta_Pais.ReadOnly = true;
            // 
            // Modificar
            // 
            this.Modificar.HeaderText = "Modificar";
            this.Modificar.Name = "Modificar";
            this.Modificar.ReadOnly = true;
            this.Modificar.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.Modificar.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Automatic;
            // 
            // Eliminar
            // 
            this.Eliminar.HeaderText = "Eliminar";
            this.Eliminar.Name = "Eliminar";
            this.Eliminar.ReadOnly = true;
            this.Eliminar.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.Eliminar.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Automatic;
            // 
            // Usuario_Habilitado
            // 
            this.Usuario_Habilitado.HeaderText = "Habilitado";
            this.Usuario_Habilitado.Name = "Usuario_Habilitado";
            this.Usuario_Habilitado.ReadOnly = true;
            this.Usuario_Habilitado.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.Usuario_Habilitado.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Automatic;
            this.Usuario_Habilitado.TrueValue = "True";
            // 
            // lblClienteID
            // 
            this.lblClienteID.AutoSize = true;
            this.lblClienteID.Enabled = false;
            this.lblClienteID.Location = new System.Drawing.Point(17, 53);
            this.lblClienteID.Name = "lblClienteID";
            this.lblClienteID.Size = new System.Drawing.Size(56, 13);
            this.lblClienteID.TabIndex = 4;
            this.lblClienteID.Text = "Cliente ID:";
            // 
            // txtClienteID
            // 
            this.txtClienteID.Enabled = false;
            this.txtClienteID.Location = new System.Drawing.Point(122, 50);
            this.txtClienteID.Name = "txtClienteID";
            this.txtClienteID.Size = new System.Drawing.Size(210, 20);
            this.txtClienteID.TabIndex = 5;
            // 
            // ABMCuentaPrincipal
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(727, 351);
            this.Controls.Add(this.btnNuevaCuenta);
            this.Controls.Add(this.btnVolver);
            this.Controls.Add(this.dgvCuenta);
            this.Controls.Add(this.panelBusqueda);
            this.Name = "ABMCuentaPrincipal";
            this.Text = "ABM de Cuenta";
            ((System.ComponentModel.ISupportInitialize)(this.dgvCuenta)).EndInit();
            this.panelBusqueda.ResumeLayout(false);
            this.panelBusqueda.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button btnNuevaCuenta;
        private System.Windows.Forms.Button btnVolver;
        private System.Windows.Forms.DataGridView dgvCuenta;
        private System.Windows.Forms.Panel panelBusqueda;
        private System.Windows.Forms.Button btnLimpiarBusqueda;
        private System.Windows.Forms.TextBox txtBuscarCuentaNumero;
        private System.Windows.Forms.Button btnBuscarCuenta;
        private System.Windows.Forms.Label lblCuentaNumero;
        private System.Windows.Forms.DataGridViewTextBoxColumn Cuenta_Numero;
        private System.Windows.Forms.DataGridViewTextBoxColumn Cuenta_Cliente_ID;
        private System.Windows.Forms.DataGridViewTextBoxColumn Cuenta_Fecha_Creacion;
        private System.Windows.Forms.DataGridViewTextBoxColumn Cuenta_Fecha_Cierre;
        private System.Windows.Forms.DataGridViewTextBoxColumn Cuenta_Saldo;
        private System.Windows.Forms.DataGridViewTextBoxColumn Cuenta_Tipo;
        private System.Windows.Forms.DataGridViewTextBoxColumn Cuenta_Estado;
        private System.Windows.Forms.DataGridViewTextBoxColumn Cuenta_Moneda;
        private System.Windows.Forms.DataGridViewTextBoxColumn Cuenta_Pais;
        private System.Windows.Forms.DataGridViewButtonColumn Modificar;
        private System.Windows.Forms.DataGridViewButtonColumn Eliminar;
        private System.Windows.Forms.DataGridViewCheckBoxColumn Usuario_Habilitado;
        private System.Windows.Forms.TextBox txtClienteID;
        private System.Windows.Forms.Label lblClienteID;

    }
}