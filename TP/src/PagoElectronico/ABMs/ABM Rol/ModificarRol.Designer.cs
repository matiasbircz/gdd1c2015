﻿namespace PagoElectronico.ABMs.ABM_Rol
{
    partial class ModificarRol
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
            this.label1 = new System.Windows.Forms.Label();
            this.NombreDelRolAModificarLabel = new System.Windows.Forms.Label();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.Funcionalidades = new System.Windows.Forms.CheckedListBox();
            this.HabilitarRolCheckbox = new System.Windows.Forms.CheckBox();
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.label3 = new System.Windows.Forms.Label();
            this.ModificarButton = new System.Windows.Forms.Button();
            this.VolverButton = new System.Windows.Forms.Button();
            this.groupBox1.SuspendLayout();
            this.groupBox2.SuspendLayout();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(9, 24);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(85, 13);
            this.label1.TabIndex = 0;
            this.label1.Text = "Nombre Del Rol:";
            // 
            // NombreDelRolAModificarLabel
            // 
            this.NombreDelRolAModificarLabel.AutoSize = true;
            this.NombreDelRolAModificarLabel.Location = new System.Drawing.Point(130, 24);
            this.NombreDelRolAModificarLabel.Name = "NombreDelRolAModificarLabel";
            this.NombreDelRolAModificarLabel.Size = new System.Drawing.Size(54, 13);
            this.NombreDelRolAModificarLabel.TabIndex = 1;
            this.NombreDelRolAModificarLabel.Text = "\"Nombre\"";
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.Funcionalidades);
            this.groupBox1.Location = new System.Drawing.Point(12, 57);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(270, 129);
            this.groupBox1.TabIndex = 2;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Funcionalidades";
            // 
            // Funcionalidades
            // 
            this.Funcionalidades.FormattingEnabled = true;
            this.Funcionalidades.Location = new System.Drawing.Point(9, 21);
            this.Funcionalidades.Name = "Funcionalidades";
            this.Funcionalidades.Size = new System.Drawing.Size(260, 94);
            this.Funcionalidades.TabIndex = 0;
            // 
            // HabilitarRolCheckbox
            // 
            this.HabilitarRolCheckbox.AutoSize = true;
            this.HabilitarRolCheckbox.Location = new System.Drawing.Point(131, 17);
            this.HabilitarRolCheckbox.Name = "HabilitarRolCheckbox";
            this.HabilitarRolCheckbox.Size = new System.Drawing.Size(64, 17);
            this.HabilitarRolCheckbox.TabIndex = 3;
            this.HabilitarRolCheckbox.Text = "Habilitar";
            this.HabilitarRolCheckbox.UseVisualStyleBackColor = true;
            // 
            // groupBox2
            // 
            this.groupBox2.Controls.Add(this.label3);
            this.groupBox2.Controls.Add(this.HabilitarRolCheckbox);
            this.groupBox2.Location = new System.Drawing.Point(12, 192);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Size = new System.Drawing.Size(269, 52);
            this.groupBox2.TabIndex = 4;
            this.groupBox2.TabStop = false;
            this.groupBox2.Text = "Estado Del Rol";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(18, 21);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(50, 13);
            this.label3.TabIndex = 4;
            this.label3.Text = "\"Estado\"";
            // 
            // ModificarButton
            // 
            this.ModificarButton.Location = new System.Drawing.Point(210, 268);
            this.ModificarButton.Name = "ModificarButton";
            this.ModificarButton.Size = new System.Drawing.Size(104, 35);
            this.ModificarButton.TabIndex = 5;
            this.ModificarButton.Text = "Modificar";
            this.ModificarButton.UseVisualStyleBackColor = true;
            // 
            // VolverButton
            // 
            this.VolverButton.Location = new System.Drawing.Point(33, 268);
            this.VolverButton.Name = "VolverButton";
            this.VolverButton.Size = new System.Drawing.Size(113, 35);
            this.VolverButton.TabIndex = 6;
            this.VolverButton.Text = "Volver";
            this.VolverButton.UseVisualStyleBackColor = true;
            // 
            // ModificarRol
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(359, 325);
            this.Controls.Add(this.VolverButton);
            this.Controls.Add(this.ModificarButton);
            this.Controls.Add(this.groupBox2);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.NombreDelRolAModificarLabel);
            this.Controls.Add(this.label1);
            this.Name = "ModificarRol";
            this.Text = "Modificar Rol";
            this.Load += new System.EventHandler(this.ModificarRol_Load);
            this.groupBox1.ResumeLayout(false);
            this.groupBox2.ResumeLayout(false);
            this.groupBox2.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label NombreDelRolAModificarLabel;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.CheckedListBox Funcionalidades;
        private System.Windows.Forms.CheckBox HabilitarRolCheckbox;
        private System.Windows.Forms.GroupBox groupBox2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Button ModificarButton;
        private System.Windows.Forms.Button VolverButton;
    }
}