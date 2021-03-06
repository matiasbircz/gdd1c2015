﻿namespace PagoElectronico.ABMs.ABM_Cliente
{
    partial class ABMClientePrincipal
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
            this.dgvClientes = new System.Windows.Forms.DataGridView();
            this.Cliente_ID = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Cliente_Nombre = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Cliente_Apellido = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Cliente_Tipo_Doc = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Cliente_Numero_Documento = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Cliente_Mail = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Cliente_Pais = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Cliente_Dom_Calle = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Cliente_Dom_Numero = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Cliente_Dom_Piso = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Cliente_Dom_Depto = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Cliente_Localidad = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Cliente_Nacionalidad = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Cliente_Fecha_Nacimiento = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Tarjetas = new System.Windows.Forms.DataGridViewButtonColumn();
            this.ModificarCliente = new System.Windows.Forms.DataGridViewButtonColumn();
            this.BorrarCliente = new System.Windows.Forms.DataGridViewButtonColumn();
            this.Cliente_Habilitado = new System.Windows.Forms.DataGridViewCheckBoxColumn();
            this.nombreClienteTextBox = new System.Windows.Forms.TextBox();
            this.ApellidoClienteTextBox = new System.Windows.Forms.TextBox();
            this.nombreClienteLabek = new System.Windows.Forms.Label();
            this.apellidoLabel = new System.Windows.Forms.Label();
            this.tipoDocComboBox = new System.Windows.Forms.ComboBox();
            this.tipoDocLabel = new System.Windows.Forms.Label();
            this.nroDocLabel = new System.Windows.Forms.Label();
            this.nroDocTextBox = new System.Windows.Forms.TextBox();
            this.nuevoClienteButton = new System.Windows.Forms.Button();
            this.mailLabel = new System.Windows.Forms.Label();
            this.mailTextBox = new System.Windows.Forms.TextBox();
            this.buscarButton = new System.Windows.Forms.Button();
            this.limpiarButton = new System.Windows.Forms.Button();
            this.volverButton = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.dgvClientes)).BeginInit();
            this.SuspendLayout();
            // 
            // dgvClientes
            // 
            this.dgvClientes.AllowUserToAddRows = false;
            this.dgvClientes.AllowUserToDeleteRows = false;
            this.dgvClientes.AllowUserToResizeColumns = false;
            this.dgvClientes.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvClientes.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.Cliente_ID,
            this.Cliente_Nombre,
            this.Cliente_Apellido,
            this.Cliente_Tipo_Doc,
            this.Cliente_Numero_Documento,
            this.Cliente_Mail,
            this.Cliente_Pais,
            this.Cliente_Dom_Calle,
            this.Cliente_Dom_Numero,
            this.Cliente_Dom_Piso,
            this.Cliente_Dom_Depto,
            this.Cliente_Localidad,
            this.Cliente_Nacionalidad,
            this.Cliente_Fecha_Nacimiento,
            this.Tarjetas,
            this.ModificarCliente,
            this.BorrarCliente,
            this.Cliente_Habilitado});
            this.dgvClientes.Location = new System.Drawing.Point(16, 279);
            this.dgvClientes.Name = "dgvClientes";
            this.dgvClientes.ReadOnly = true;
            this.dgvClientes.Size = new System.Drawing.Size(646, 176);
            this.dgvClientes.TabIndex = 0;
            this.dgvClientes.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dgvClientes_CellContentClick);
            // 
            // Cliente_ID
            // 
            this.Cliente_ID.HeaderText = "Cliente_ID";
            this.Cliente_ID.Name = "Cliente_ID";
            this.Cliente_ID.ReadOnly = true;
            // 
            // Cliente_Nombre
            // 
            this.Cliente_Nombre.HeaderText = "Cliente_Nombre";
            this.Cliente_Nombre.Name = "Cliente_Nombre";
            this.Cliente_Nombre.ReadOnly = true;
            // 
            // Cliente_Apellido
            // 
            this.Cliente_Apellido.HeaderText = "Cliente_Apellido";
            this.Cliente_Apellido.Name = "Cliente_Apellido";
            this.Cliente_Apellido.ReadOnly = true;
            // 
            // Cliente_Tipo_Doc
            // 
            this.Cliente_Tipo_Doc.HeaderText = "Cliente_Tipo_Doc";
            this.Cliente_Tipo_Doc.Name = "Cliente_Tipo_Doc";
            this.Cliente_Tipo_Doc.ReadOnly = true;
            // 
            // Cliente_Numero_Documento
            // 
            this.Cliente_Numero_Documento.HeaderText = "Cliente_Numero_Documento";
            this.Cliente_Numero_Documento.Name = "Cliente_Numero_Documento";
            this.Cliente_Numero_Documento.ReadOnly = true;
            // 
            // Cliente_Mail
            // 
            this.Cliente_Mail.HeaderText = "Cliente_Mail";
            this.Cliente_Mail.Name = "Cliente_Mail";
            this.Cliente_Mail.ReadOnly = true;
            // 
            // Cliente_Pais
            // 
            this.Cliente_Pais.HeaderText = "Cliente_Pais";
            this.Cliente_Pais.Name = "Cliente_Pais";
            this.Cliente_Pais.ReadOnly = true;
            // 
            // Cliente_Dom_Calle
            // 
            this.Cliente_Dom_Calle.HeaderText = "Cliente_Dom_Calle";
            this.Cliente_Dom_Calle.Name = "Cliente_Dom_Calle";
            this.Cliente_Dom_Calle.ReadOnly = true;
            // 
            // Cliente_Dom_Numero
            // 
            this.Cliente_Dom_Numero.HeaderText = "Cliente_Dom_Numero";
            this.Cliente_Dom_Numero.Name = "Cliente_Dom_Numero";
            this.Cliente_Dom_Numero.ReadOnly = true;
            // 
            // Cliente_Dom_Piso
            // 
            this.Cliente_Dom_Piso.HeaderText = "Cliente_Dom_Piso";
            this.Cliente_Dom_Piso.Name = "Cliente_Dom_Piso";
            this.Cliente_Dom_Piso.ReadOnly = true;
            // 
            // Cliente_Dom_Depto
            // 
            this.Cliente_Dom_Depto.HeaderText = "Cliente_Dom_Depto";
            this.Cliente_Dom_Depto.Name = "Cliente_Dom_Depto";
            this.Cliente_Dom_Depto.ReadOnly = true;
            // 
            // Cliente_Localidad
            // 
            this.Cliente_Localidad.HeaderText = "Cliente_Localidad";
            this.Cliente_Localidad.Name = "Cliente_Localidad";
            this.Cliente_Localidad.ReadOnly = true;
            // 
            // Cliente_Nacionalidad
            // 
            this.Cliente_Nacionalidad.HeaderText = "Cliente_Nacionalidad";
            this.Cliente_Nacionalidad.Name = "Cliente_Nacionalidad";
            this.Cliente_Nacionalidad.ReadOnly = true;
            // 
            // Cliente_Fecha_Nacimiento
            // 
            this.Cliente_Fecha_Nacimiento.HeaderText = "Cliente_Fecha_Nacimiento";
            this.Cliente_Fecha_Nacimiento.Name = "Cliente_Fecha_Nacimiento";
            this.Cliente_Fecha_Nacimiento.ReadOnly = true;
            // 
            // Tarjetas
            // 
            this.Tarjetas.HeaderText = "Tarjetas";
            this.Tarjetas.Name = "Tarjetas";
            this.Tarjetas.ReadOnly = true;
            this.Tarjetas.Text = "Ver";
            // 
            // ModificarCliente
            // 
            this.ModificarCliente.HeaderText = "Modificar Cliente";
            this.ModificarCliente.Name = "ModificarCliente";
            this.ModificarCliente.ReadOnly = true;
            // 
            // BorrarCliente
            // 
            this.BorrarCliente.HeaderText = "Borrar Cliente";
            this.BorrarCliente.Name = "BorrarCliente";
            this.BorrarCliente.ReadOnly = true;
            // 
            // Cliente_Habilitado
            // 
            this.Cliente_Habilitado.HeaderText = "Cliente_Habilitado";
            this.Cliente_Habilitado.Name = "Cliente_Habilitado";
            this.Cliente_Habilitado.ReadOnly = true;
            // 
            // nombreClienteTextBox
            // 
            this.nombreClienteTextBox.Location = new System.Drawing.Point(135, 23);
            this.nombreClienteTextBox.Name = "nombreClienteTextBox";
            this.nombreClienteTextBox.Size = new System.Drawing.Size(114, 20);
            this.nombreClienteTextBox.TabIndex = 1;
            this.nombreClienteTextBox.TextChanged += new System.EventHandler(this.nombreClienteTextBox_TextChanged);
            // 
            // ApellidoClienteTextBox
            // 
            this.ApellidoClienteTextBox.Location = new System.Drawing.Point(135, 62);
            this.ApellidoClienteTextBox.Name = "ApellidoClienteTextBox";
            this.ApellidoClienteTextBox.Size = new System.Drawing.Size(114, 20);
            this.ApellidoClienteTextBox.TabIndex = 2;
            // 
            // nombreClienteLabek
            // 
            this.nombreClienteLabek.AutoSize = true;
            this.nombreClienteLabek.Location = new System.Drawing.Point(13, 30);
            this.nombreClienteLabek.Name = "nombreClienteLabek";
            this.nombreClienteLabek.Size = new System.Drawing.Size(44, 13);
            this.nombreClienteLabek.TabIndex = 3;
            this.nombreClienteLabek.Text = "Nombre";
            // 
            // apellidoLabel
            // 
            this.apellidoLabel.AutoSize = true;
            this.apellidoLabel.Location = new System.Drawing.Point(16, 65);
            this.apellidoLabel.Name = "apellidoLabel";
            this.apellidoLabel.Size = new System.Drawing.Size(44, 13);
            this.apellidoLabel.TabIndex = 4;
            this.apellidoLabel.Text = "Apellido";
            // 
            // tipoDocComboBox
            // 
            this.tipoDocComboBox.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.tipoDocComboBox.FormattingEnabled = true;
            this.tipoDocComboBox.Location = new System.Drawing.Point(135, 99);
            this.tipoDocComboBox.Name = "tipoDocComboBox";
            this.tipoDocComboBox.Size = new System.Drawing.Size(114, 21);
            this.tipoDocComboBox.TabIndex = 5;
            // 
            // tipoDocLabel
            // 
            this.tipoDocLabel.AutoSize = true;
            this.tipoDocLabel.Location = new System.Drawing.Point(16, 102);
            this.tipoDocLabel.Name = "tipoDocLabel";
            this.tipoDocLabel.Size = new System.Drawing.Size(86, 13);
            this.tipoDocLabel.TabIndex = 6;
            this.tipoDocLabel.Text = "Tipo Documento";
            // 
            // nroDocLabel
            // 
            this.nroDocLabel.AutoSize = true;
            this.nroDocLabel.Location = new System.Drawing.Point(298, 102);
            this.nroDocLabel.Name = "nroDocLabel";
            this.nroDocLabel.Size = new System.Drawing.Size(82, 13);
            this.nroDocLabel.TabIndex = 7;
            this.nroDocLabel.Text = "Nro Documento";
            // 
            // nroDocTextBox
            // 
            this.nroDocTextBox.Location = new System.Drawing.Point(386, 99);
            this.nroDocTextBox.Name = "nroDocTextBox";
            this.nroDocTextBox.Size = new System.Drawing.Size(139, 20);
            this.nroDocTextBox.TabIndex = 8;
            // 
            // nuevoClienteButton
            // 
            this.nuevoClienteButton.Location = new System.Drawing.Point(403, 200);
            this.nuevoClienteButton.Name = "nuevoClienteButton";
            this.nuevoClienteButton.Size = new System.Drawing.Size(86, 70);
            this.nuevoClienteButton.TabIndex = 9;
            this.nuevoClienteButton.Text = "Nuevo Cliente";
            this.nuevoClienteButton.UseVisualStyleBackColor = true;
            this.nuevoClienteButton.Click += new System.EventHandler(this.nuevoClienteButton_Click);
            // 
            // mailLabel
            // 
            this.mailLabel.AutoSize = true;
            this.mailLabel.Location = new System.Drawing.Point(19, 139);
            this.mailLabel.Name = "mailLabel";
            this.mailLabel.Size = new System.Drawing.Size(26, 13);
            this.mailLabel.TabIndex = 10;
            this.mailLabel.Text = "Mail";
            // 
            // mailTextBox
            // 
            this.mailTextBox.Location = new System.Drawing.Point(135, 136);
            this.mailTextBox.Name = "mailTextBox";
            this.mailTextBox.Size = new System.Drawing.Size(114, 20);
            this.mailTextBox.TabIndex = 11;
            // 
            // buscarButton
            // 
            this.buscarButton.Location = new System.Drawing.Point(12, 219);
            this.buscarButton.Name = "buscarButton";
            this.buscarButton.Size = new System.Drawing.Size(171, 32);
            this.buscarButton.TabIndex = 12;
            this.buscarButton.Text = "Buscar";
            this.buscarButton.UseVisualStyleBackColor = true;
            this.buscarButton.Click += new System.EventHandler(this.buscarButton_Click);
            // 
            // limpiarButton
            // 
            this.limpiarButton.Location = new System.Drawing.Point(202, 219);
            this.limpiarButton.Name = "limpiarButton";
            this.limpiarButton.Size = new System.Drawing.Size(171, 32);
            this.limpiarButton.TabIndex = 13;
            this.limpiarButton.Text = "Limpiar";
            this.limpiarButton.UseVisualStyleBackColor = true;
            this.limpiarButton.Click += new System.EventHandler(this.limpiarButton_Click);
            // 
            // volverButton
            // 
            this.volverButton.Location = new System.Drawing.Point(688, 279);
            this.volverButton.Name = "volverButton";
            this.volverButton.Size = new System.Drawing.Size(75, 70);
            this.volverButton.TabIndex = 15;
            this.volverButton.Text = "Volver";
            this.volverButton.UseVisualStyleBackColor = true;
            this.volverButton.Click += new System.EventHandler(this.volverButton_Click);
            // 
            // ABMClientePrincipal
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(821, 530);
            this.Controls.Add(this.volverButton);
            this.Controls.Add(this.limpiarButton);
            this.Controls.Add(this.buscarButton);
            this.Controls.Add(this.mailTextBox);
            this.Controls.Add(this.mailLabel);
            this.Controls.Add(this.nuevoClienteButton);
            this.Controls.Add(this.nroDocTextBox);
            this.Controls.Add(this.nroDocLabel);
            this.Controls.Add(this.tipoDocLabel);
            this.Controls.Add(this.tipoDocComboBox);
            this.Controls.Add(this.apellidoLabel);
            this.Controls.Add(this.nombreClienteLabek);
            this.Controls.Add(this.ApellidoClienteTextBox);
            this.Controls.Add(this.nombreClienteTextBox);
            this.Controls.Add(this.dgvClientes);
            this.Name = "ABMClientePrincipal";
            this.Text = "ABMClientePrincipal";
            this.Load += new System.EventHandler(this.ABMClientePrincipal_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dgvClientes)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DataGridView dgvClientes;
        private System.Windows.Forms.TextBox nombreClienteTextBox;
        private System.Windows.Forms.TextBox ApellidoClienteTextBox;
        private System.Windows.Forms.Label nombreClienteLabek;
        private System.Windows.Forms.Label apellidoLabel;
        private System.Windows.Forms.ComboBox tipoDocComboBox;
        private System.Windows.Forms.Label tipoDocLabel;
        private System.Windows.Forms.Label nroDocLabel;
        private System.Windows.Forms.TextBox nroDocTextBox;
        private System.Windows.Forms.Button nuevoClienteButton;
        private System.Windows.Forms.Label mailLabel;
        private System.Windows.Forms.TextBox mailTextBox;
        private System.Windows.Forms.Button buscarButton;
        private System.Windows.Forms.Button limpiarButton;
        private System.Windows.Forms.Button volverButton;
        private System.Windows.Forms.DataGridViewTextBoxColumn Cliente_ID;
        private System.Windows.Forms.DataGridViewTextBoxColumn Cliente_Nombre;
        private System.Windows.Forms.DataGridViewTextBoxColumn Cliente_Apellido;
        private System.Windows.Forms.DataGridViewTextBoxColumn Cliente_Tipo_Doc;
        private System.Windows.Forms.DataGridViewTextBoxColumn Cliente_Numero_Documento;
        private System.Windows.Forms.DataGridViewTextBoxColumn Cliente_Mail;
        private System.Windows.Forms.DataGridViewTextBoxColumn Cliente_Pais;
        private System.Windows.Forms.DataGridViewTextBoxColumn Cliente_Dom_Calle;
        private System.Windows.Forms.DataGridViewTextBoxColumn Cliente_Dom_Numero;
        private System.Windows.Forms.DataGridViewTextBoxColumn Cliente_Dom_Piso;
        private System.Windows.Forms.DataGridViewTextBoxColumn Cliente_Dom_Depto;
        private System.Windows.Forms.DataGridViewTextBoxColumn Cliente_Localidad;
        private System.Windows.Forms.DataGridViewTextBoxColumn Cliente_Nacionalidad;
        private System.Windows.Forms.DataGridViewTextBoxColumn Cliente_Fecha_Nacimiento;
        private System.Windows.Forms.DataGridViewButtonColumn Tarjetas;
        private System.Windows.Forms.DataGridViewButtonColumn ModificarCliente;
        private System.Windows.Forms.DataGridViewButtonColumn BorrarCliente;
        private System.Windows.Forms.DataGridViewCheckBoxColumn Cliente_Habilitado;
                    
    }
}