﻿namespace PagoElectronico.ABMs.ABM_Cuenta
{
    partial class AltaCuenta
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
            this.btnVolver = new System.Windows.Forms.Button();
            this.groupBoxNuevaCuenta = new System.Windows.Forms.GroupBox();
            this.cmbTipoCuenta = new System.Windows.Forms.ComboBox();
            this.cmbMoneda = new System.Windows.Forms.ComboBox();
            this.cmbPais = new System.Windows.Forms.ComboBox();
            this.txtClienteID = new System.Windows.Forms.TextBox();
            this.lblClienteID = new System.Windows.Forms.Label();
            this.lblTipoCuenta = new System.Windows.Forms.Label();
            this.lblMoneda = new System.Windows.Forms.Label();
            this.lblPais = new System.Windows.Forms.Label();
            this.btnAltaCuenta = new System.Windows.Forms.Button();
            this.groupBoxNuevaCuenta.SuspendLayout();
            this.SuspendLayout();
            // 
            // btnVolver
            // 
            this.btnVolver.Location = new System.Drawing.Point(296, 242);
            this.btnVolver.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.btnVolver.Name = "btnVolver";
            this.btnVolver.Size = new System.Drawing.Size(112, 35);
            this.btnVolver.TabIndex = 0;
            this.btnVolver.Text = "Volver";
            this.btnVolver.UseVisualStyleBackColor = true;
            this.btnVolver.Click += new System.EventHandler(this.btnVolver_Click);
            // 
            // groupBoxNuevaCuenta
            // 
            this.groupBoxNuevaCuenta.Controls.Add(this.cmbTipoCuenta);
            this.groupBoxNuevaCuenta.Controls.Add(this.cmbMoneda);
            this.groupBoxNuevaCuenta.Controls.Add(this.cmbPais);
            this.groupBoxNuevaCuenta.Controls.Add(this.txtClienteID);
            this.groupBoxNuevaCuenta.Controls.Add(this.lblClienteID);
            this.groupBoxNuevaCuenta.Controls.Add(this.lblTipoCuenta);
            this.groupBoxNuevaCuenta.Controls.Add(this.lblMoneda);
            this.groupBoxNuevaCuenta.Controls.Add(this.lblPais);
            this.groupBoxNuevaCuenta.Location = new System.Drawing.Point(20, 20);
            this.groupBoxNuevaCuenta.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.groupBoxNuevaCuenta.Name = "groupBoxNuevaCuenta";
            this.groupBoxNuevaCuenta.Padding = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.groupBoxNuevaCuenta.Size = new System.Drawing.Size(388, 212);
            this.groupBoxNuevaCuenta.TabIndex = 1;
            this.groupBoxNuevaCuenta.TabStop = false;
            this.groupBoxNuevaCuenta.Text = "Nueva Cuenta";
            // 
            // cmbTipoCuenta
            // 
            this.cmbTipoCuenta.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbTipoCuenta.FormattingEnabled = true;
            this.cmbTipoCuenta.Location = new System.Drawing.Point(171, 154);
            this.cmbTipoCuenta.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.cmbTipoCuenta.Name = "cmbTipoCuenta";
            this.cmbTipoCuenta.Size = new System.Drawing.Size(180, 28);
            this.cmbTipoCuenta.TabIndex = 7;
            // 
            // cmbMoneda
            // 
            this.cmbMoneda.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbMoneda.FormattingEnabled = true;
            this.cmbMoneda.Location = new System.Drawing.Point(171, 112);
            this.cmbMoneda.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.cmbMoneda.Name = "cmbMoneda";
            this.cmbMoneda.Size = new System.Drawing.Size(180, 28);
            this.cmbMoneda.TabIndex = 6;
            // 
            // cmbPais
            // 
            this.cmbPais.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbPais.FormattingEnabled = true;
            this.cmbPais.Location = new System.Drawing.Point(171, 71);
            this.cmbPais.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.cmbPais.Name = "cmbPais";
            this.cmbPais.Size = new System.Drawing.Size(180, 28);
            this.cmbPais.TabIndex = 5;
            // 
            // txtClienteID
            // 
            this.txtClienteID.Enabled = false;
            this.txtClienteID.Location = new System.Drawing.Point(171, 31);
            this.txtClienteID.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.txtClienteID.Name = "txtClienteID";
            this.txtClienteID.Size = new System.Drawing.Size(180, 26);
            this.txtClienteID.TabIndex = 4;
            // 
            // lblClienteID
            // 
            this.lblClienteID.AutoSize = true;
            this.lblClienteID.Enabled = false;
            this.lblClienteID.Location = new System.Drawing.Point(9, 35);
            this.lblClienteID.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.lblClienteID.Name = "lblClienteID";
            this.lblClienteID.Size = new System.Drawing.Size(144, 20);
            this.lblClienteID.TabIndex = 3;
            this.lblClienteID.Text = "Numero de Cliente:";
            // 
            // lblTipoCuenta
            // 
            this.lblTipoCuenta.AutoSize = true;
            this.lblTipoCuenta.Location = new System.Drawing.Point(9, 158);
            this.lblTipoCuenta.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.lblTipoCuenta.Name = "lblTipoCuenta";
            this.lblTipoCuenta.Size = new System.Drawing.Size(117, 20);
            this.lblTipoCuenta.TabIndex = 2;
            this.lblTipoCuenta.Text = "Tipo de Cuenta";
            // 
            // lblMoneda
            // 
            this.lblMoneda.AutoSize = true;
            this.lblMoneda.Location = new System.Drawing.Point(9, 117);
            this.lblMoneda.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.lblMoneda.Name = "lblMoneda";
            this.lblMoneda.Size = new System.Drawing.Size(71, 20);
            this.lblMoneda.TabIndex = 1;
            this.lblMoneda.Text = "Moneda:";
            // 
            // lblPais
            // 
            this.lblPais.AutoSize = true;
            this.lblPais.Location = new System.Drawing.Point(9, 75);
            this.lblPais.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.lblPais.Name = "lblPais";
            this.lblPais.Size = new System.Drawing.Size(43, 20);
            this.lblPais.TabIndex = 0;
            this.lblPais.Text = "Pais:";
            // 
            // btnAltaCuenta
            // 
            this.btnAltaCuenta.Location = new System.Drawing.Point(20, 242);
            this.btnAltaCuenta.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.btnAltaCuenta.Name = "btnAltaCuenta";
            this.btnAltaCuenta.Size = new System.Drawing.Size(250, 35);
            this.btnAltaCuenta.TabIndex = 2;
            this.btnAltaCuenta.Text = "Dar de Alta";
            this.btnAltaCuenta.UseVisualStyleBackColor = true;
            this.btnAltaCuenta.Click += new System.EventHandler(this.btnAltaCuenta_Click);
            // 
            // AltaCuenta
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(9F, 20F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(426, 289);
            this.Controls.Add(this.btnAltaCuenta);
            this.Controls.Add(this.groupBoxNuevaCuenta);
            this.Controls.Add(this.btnVolver);
            this.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.Name = "AltaCuenta";
            this.Text = "Alta de Cuenta";
            this.groupBoxNuevaCuenta.ResumeLayout(false);
            this.groupBoxNuevaCuenta.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button btnVolver;
        private System.Windows.Forms.GroupBox groupBoxNuevaCuenta;
        private System.Windows.Forms.Label lblPais;
        private System.Windows.Forms.Label lblTipoCuenta;
        private System.Windows.Forms.Label lblMoneda;
        private System.Windows.Forms.TextBox txtClienteID;
        private System.Windows.Forms.Label lblClienteID;
        private System.Windows.Forms.ComboBox cmbTipoCuenta;
        private System.Windows.Forms.ComboBox cmbMoneda;
        private System.Windows.Forms.ComboBox cmbPais;
        private System.Windows.Forms.Button btnAltaCuenta;
    }
}