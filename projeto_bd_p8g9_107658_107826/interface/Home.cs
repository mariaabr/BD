using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace ProjetoBD
{
    public partial class Home : Form
    {
        //private SqlConnection connection;
        private SqlDataAdapter dataAdapter;
        private DataTable dataTable;
        private int numIdentificacaoModalidade; //usar no comboBoxModalidade
        private string nomeEscalao;


        public Home()
        {
            InitializeComponent();

            //Conexão
            //connection = new SqlConnection("Data Source= mednat.ieeta.pt\\SQLSERVER,8101;Initial Catalog= p8g9 ;uid= p8g9;password=MartaRafa.2021");
            //string connectionString = "Data Source= mednat.ieeta.pt\\SQLSERVER,8101;Initial Catalog= p8g9 ;uid= p8g9;password=MartaRafa.2021";


            //por causa do modalidades combox
            comboBoxmodalInstalacao.DataSource = GetModalidadeData();
            comboBoxmodalInstalacao.DisplayMember = "Nome";
            comboBoxmodalInstalacao.ValueMember = "Num_identificacao";

            //por causa das equipas combox
            comboBoxModalEuipa.DataSource = GetModalidadeData();
            comboBoxModalEuipa.DisplayMember = "Nome";
            comboBoxModalEuipa.ValueMember = "Num_identificacao";

            //por causa dos escaloes na equipa
            comboBoxEscalaoEquipa.DataSource = GetEscalaoData();
            comboBoxEscalaoEquipa.DisplayMember = "Nome";
            comboBoxEscalaoEquipa.ValueMember = "Nome";

            //por causa dos escaloes no Treinador
            comboBoxEscalaoTreinador.DataSource = GetEscalaoData();
            comboBoxEscalaoTreinador.DisplayMember = "Nome";
            comboBoxEscalaoTreinador.ValueMember = "Nome";

            //por causa dos escaloes no Profissional de saúde
            comboBoxEscaloProfSaude.DataSource = GetEscalaoData();
            comboBoxEscaloProfSaude.DisplayMember = "Nome";
            comboBoxEscaloProfSaude.ValueMember = "Nome";

            //por causa dos escaloes no Atleta
            comboBoxEscalAtleta.DataSource = GetEscalaoData();
            comboBoxEscalAtleta.DisplayMember = "Nome";
            comboBoxEscalAtleta.ValueMember = "Nome";

            //por causa das equipamento combox
            comboBoxModalEquipamentos.DataSource = GetModalidadeData();
            comboBoxModalEquipamentos.DisplayMember = "Nome";
            comboBoxModalEquipamentos.ValueMember = "Num_identificacao";

            //por causa do material combox
             comboBoxModalMaterial.DataSource = GetModalidadeData();
             comboBoxModalMaterial.DisplayMember = "Nome";
            comboBoxModalMaterial.ValueMember = "Num_identificacao";

        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        //concultar instalação
        private void button1_Click(object sender, EventArgs e) {
            string connectionString = "Data Source= mednat.ieeta.pt\\SQLSERVER,8101;Initial Catalog= p8g9 ;uid= p8g9;password=MartaRafa.2021";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    // Create a new instance of the SqlDataAdapter
                    dataAdapter = new SqlDataAdapter();

                    // Set the SelectCommand to the stored procedure
                    dataAdapter.SelectCommand = new SqlCommand("sp_consult_instalacao", connection);
                    dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;

                    // Create a new DataTable
                    dataTable = new DataTable();

                    // Fill the DataTable with the data from the stored procedure
                    dataAdapter.Fill(dataTable);

                    // Set the DataTable as the data source for the DataGridView
                    dataGridView8.DataSource = dataTable;
                }

                catch (Exception ex)
                {
                    MessageBox.Show("Error: " + ex.Message);
                }
            }
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            //if(dataGridView8.SelectedRows.Count > 0)
            //{
            //    //opção selecionada
            //    DataGridViewRow row = dataGridView8.SelectedRows[0];

            //    //buscar o nome da categoria
            //    textBox9.Text = row.Cells["Nome"].Value.ToString();
            //    textBox10.Text = row.Cells["Morada"].Value.ToString();
            //    textBox11.Text = row.Cells["Modalidade"].Value.ToString();

            //}            
        }

        private void Home_Load(object sender, EventArgs e)
        {

        }

        private void dataGridView8_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            //dataGridView8.ColumnCount = 3; // Set the number of columns

            //dataGridView8.Columns[0].Name = "Nome"; // Set the header text for Column 1
            //dataGridView8.Columns[1].Name = "Morada"; // Set the header text for Column 2
            //dataGridView8.Columns[2].Name = "Modalidadeeeeeeeeeeeeeeeeeeeee"; // Set the header text for Column 3
        }

        //eliminar instalacao
        private void button17_Click(object sender, EventArgs e)
        {
            string connectionString = "Data Source= mednat.ieeta.pt\\SQLSERVER,8101;Initial Catalog= p8g9 ;uid= p8g9;password=MartaRafa.2021";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    string inputValue = textBoxNomInstalacao.Text; // Get the input value from the textbox

                    // Create a new instance of the SqlCommand
                    SqlCommand command = new SqlCommand("sp_delete_instalacao", connection);
                    command.CommandType = CommandType.StoredProcedure;

                    // Add the input parameter to the command
                    command.Parameters.AddWithValue("@nome", inputValue);

                    // Open the database connection
                    connection.Open();

                    // Execute the command
                    command.ExecuteNonQuery();

                    // Display a success message
                    MessageBox.Show("Element deleted successfully!");

                    // Close the database connection
                    connection.Close();
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Error: " + ex.Message);
                }
            }
        }

        private void label4_Click(object sender, EventArgs e)
        {

        }

        private void button1_Click_1(object sender, EventArgs e)
        {

        }

        private void dataGridView8_CellContentClick_1(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void comboBox1_SelectedIndexChanged_1(object sender, EventArgs e)
        {

        }

        private void button2_Click(object sender, EventArgs e)
        {

        }

        private void button17_Click_1(object sender, EventArgs e)
        {

        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void comboBox8_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        //fazer o combobox 
        private DataTable GetModalidadeData()
        {
            DataTable dataTable = new DataTable();

            string connectionString = "Data Source= mednat.ieeta.pt\\SQLSERVER,8101;Initial Catalog= p8g9 ;uid= p8g9;password=MartaRafa.2021";
            // Replace with your actual connection string
            string query = "SELECT Num_identificacao, Nome FROM Modalidade";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(query, connection);
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                adapter.Fill(dataTable);
            }

            return dataTable;
        }



        //criar instalacao
        private void button2_Click_1(object sender, EventArgs e)
        {
            string connectionString = "Data Source= mednat.ieeta.pt\\SQLSERVER,8101;Initial Catalog= p8g9 ;uid= p8g9;password=MartaRafa.2021";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    string arg1 = textBoxNomInstalacao.Text;
                    string arg2 = textBoxmoradaInstal.Text; // Get the value of argument 2 from the textbo
                    int arg3 = numIdentificacaoModalidade;

                    // Create a new instance of the SqlCommand
                    SqlCommand command = new SqlCommand("sp_createInstalacao", connection);
                    command.CommandType = CommandType.StoredProcedure;

                    // Add the input parameters to the command
                    command.Parameters.AddWithValue("@Nome", arg1);
                    command.Parameters.AddWithValue("@Morada", arg2);
                    command.Parameters.AddWithValue("@FK_Num_identificacao_modalidade", arg3);
                    // Add other input parameters

                    // Open the database connection
                    connection.Open();

                    // Execute the command
                    command.ExecuteNonQuery();

                    // Display a success message
                    MessageBox.Show("Element created successfully!");

                    // Close the database connection
                    connection.Close();
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Error: " + ex.Message);
                }
            }
        }


        private void comboBoxmodalInstalacao_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Get the selected item from the comboBox
            DataRowView selectedRow = (DataRowView)comboBoxmodalInstalacao.SelectedItem;

            // Retrieve the Num_identificacao value from the selected item
            if (selectedRow != null)
            {
                numIdentificacaoModalidade = Convert.ToInt32(selectedRow["Num_identificacao"]);
            }
        }


        private void textBox9_TextChanged(object sender, EventArgs e)
        {

        }

        //consultar modalidade
        private void button4_Click(object sender, EventArgs e)
        {
            string connectionString = "Data Source= mednat.ieeta.pt\\SQLSERVER,8101;Initial Catalog= p8g9 ;uid= p8g9;password=MartaRafa.2021";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    // Create a new instance of the SqlDataAdapter
                    dataAdapter = new SqlDataAdapter();

                    // Set the SelectCommand to the stored procedure
                    dataAdapter.SelectCommand = new SqlCommand("sp_consult_modalidade", connection);
                    dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;

                    // Create a new DataTable
                    dataTable = new DataTable();

                    // Fill the DataTable with the data from the stored procedure
                    dataAdapter.Fill(dataTable);

                    // Set the DataTable as the data source for the DataGridView
                    dataGridView7.DataSource = dataTable;
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Error: " + ex.Message);
                }
            }
        }

        private void button3_Click(object sender, EventArgs e)
        {
            //eliminar modalidade probably inutil
        }

        private void tabPage1_Click(object sender, EventArgs e)
        {

        }

        //consultar escalao
        private void button6_Click(object sender, EventArgs e)
        {
            string connectionString = "Data Source= mednat.ieeta.pt\\SQLSERVER,8101;Initial Catalog= p8g9 ;uid= p8g9;password=MartaRafa.2021";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    // Create a new instance of the SqlDataAdapter
                    dataAdapter = new SqlDataAdapter();

                    // Set the SelectCommand to the stored procedure
                    dataAdapter.SelectCommand = new SqlCommand("EscalaoList", connection);
                    dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;

                    // Create a new DataTable
                    dataTable = new DataTable();

                    // Fill the DataTable with the data from the stored procedure
                    dataAdapter.Fill(dataTable);

                    // Set the DataTable as the data source for the DataGridView
                    dataGridView6.DataSource = dataTable;
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Error: " + ex.Message);
                }
            }
        }

        private void button5_Click(object sender, EventArgs e)
        {
            string connectionString = "Data Source= mednat.ieeta.pt\\SQLSERVER,8101;Initial Catalog= p8g9 ;uid= p8g9;password=MartaRafa.2021";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    string inputValue = textBoxnomEscalao.Text; // Get the input value from the textbox

                    // Create a new instance of the SqlCommand
                    SqlCommand command = new SqlCommand("sp_delete_escalao", connection);
                    command.CommandType = CommandType.StoredProcedure;

                    // Add the input parameter to the command
                    command.Parameters.AddWithValue("@nome", inputValue);

                    // Open the database connection
                    connection.Open();

                    // Execute the command
                    command.ExecuteNonQuery();

                    // Display a success message
                    MessageBox.Show("Element deleted successfully!");

                    // Close the database connection
                    connection.Close();
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Error: " + ex.Message);
                }
            }
        }


        private DataTable GetEscalaoData()
        {
            DataTable dataTable = new DataTable();
            string connectionString = "Data Source= mednat.ieeta.pt\\SQLSERVER,8101;Initial Catalog= p8g9 ;uid= p8g9;password=MartaRafa.2021";
            string query = "SELECT Nome FROM Escalao";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(query, connection);
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                adapter.Fill(dataTable);
            }
            return dataTable;
        }

        //private void buttonSubmit_Click(object sender, EventArgs e)
        //{
        //    // Get the selected value from the ComboBox
        //    nomeEscalao = comboBoxEscalaoEquipa.SelectedValue.ToString();

        //    // Use the selected value as needed
        //    Console.WriteLine("Selected Escalao: " + nomeEscalao);
        //}

        private void button8_Click(object sender, EventArgs e)
        {
            string connectionString = "Data Source= mednat.ieeta.pt\\SQLSERVER,8101;Initial Catalog= p8g9 ;uid= p8g9;password=MartaRafa.2021";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    // Create a new instance of the SqlDataAdapter
                    dataAdapter = new SqlDataAdapter();

                    // Set the SelectCommand to the stored procedure
                    dataAdapter.SelectCommand = new SqlCommand("sp_consult_equipa", connection);
                    dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;

                    // Create a new DataTable
                    dataTable = new DataTable();

                    // Fill the DataTable with the data from the stored procedure
                    dataAdapter.Fill(dataTable);

                    // Set the DataTable as the data source for the DataGridView
                    dataGridView5.DataSource = dataTable;
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Error: " + ex.Message);
                }
            }
        }

        private void button7_Click(object sender, EventArgs e)
        {
            string connectionString = "Data Source= mednat.ieeta.pt\\SQLSERVER,8101;Initial Catalog= p8g9 ;uid= p8g9;password=MartaRafa.2021";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {

                    nomeEscalao = comboBoxEscalaoEquipa.SelectedValue.ToString();

                    // Use the selected value as needed
                    Console.WriteLine("Selected Escalao: " + nomeEscalao);

                    string arg1 = textBoxnomEquipa.Text;
                    string arg2 = textBoxgenEquipa.Text; // Get the value of argument 2 from the textbo
                    string arg3 = nomeEscalao;
                    int arg4 = Convert.ToInt32(textBoxnumjogEquipa.Text);

                    // Create a new instance of the SqlCommand
                    SqlCommand command = new SqlCommand("sp_createEquipa", connection);
                    command.CommandType = CommandType.StoredProcedure;

                    // Add the input parameters to the command
                    command.Parameters.AddWithValue("@Nome_escalao", arg3);
                    command.Parameters.AddWithValue("@Nome", arg1);
                    command.Parameters.AddWithValue("@Genero", arg2);
                    command.Parameters.AddWithValue("@Num_jogadores", arg4);
                    // Add other input parameters

                    // Open the database connection
                    connection.Open();

                    // Execute the command
                    command.ExecuteNonQuery();

                    // Display a success message
                    MessageBox.Show("Element created successfully!");

                    // Close the database connection
                    connection.Close();
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Error: " + ex.Message);
                }
            }
        }

        private void button18_Click(object sender, EventArgs e)
        {
            string connectionString = "Data Source= mednat.ieeta.pt\\SQLSERVER,8101;Initial Catalog= p8g9 ;uid= p8g9;password=MartaRafa.2021";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    string inputValue = textBoxIdEquipa.Text; // Get the input value from the textbox

                    // Create a new instance of the SqlCommand
                    SqlCommand command = new SqlCommand("sp_delete_equipa", connection);
                    command.CommandType = CommandType.StoredProcedure;

                    // Add the input parameter to the command
                    command.Parameters.AddWithValue("@id", inputValue);

                    // Open the database connection
                    connection.Open();

                    // Execute the command
                    command.ExecuteNonQuery();

                    // Display a success message
                    MessageBox.Show("Element deleted successfully!");

                    // Close the database connection
                    connection.Close();
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Error: " + ex.Message);
                }
            }
        }

        private void button10_Click(object sender, EventArgs e)
        {
            string connectionString = "Data Source= mednat.ieeta.pt\\SQLSERVER,8101;Initial Catalog= p8g9 ;uid= p8g9;password=MartaRafa.2021";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    // Create a new instance of the SqlDataAdapter
                    dataAdapter = new SqlDataAdapter();

                    // Set the SelectCommand to the stored procedure
                    dataAdapter.SelectCommand = new SqlCommand("sp_consult_equipamento", connection);
                    dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;

                    // Create a new DataTable
                    dataTable = new DataTable();

                    // Fill the DataTable with the data from the stored procedure
                    dataAdapter.Fill(dataTable);

                    // Set the DataTable as the data source for the DataGridView
                    dataGridView4.DataSource = dataTable;
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Error: " + ex.Message);
                }
            }
        }


        private void comboBoxModalEquipamentos_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Get the selected item from the comboBox
            DataRowView selectedRow = (DataRowView)comboBoxModalEquipamentos.SelectedItem;

            // Retrieve the Num_identificacao value from the selected item
            if (selectedRow != null)
            {
                numIdentificacaoModalidade = Convert.ToInt32(selectedRow["Num_identificacao"]);
            }
        }

        private void button9_Click(object sender, EventArgs e)
        {
            string connectionString = "Data Source= mednat.ieeta.pt\\SQLSERVER,8101;Initial Catalog= p8g9 ;uid= p8g9;password=MartaRafa.2021";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    
                    string arg1 = textBoxCOREquipamento.Text;
                    int arg2 = numIdentificacaoModalidade; // Get the value of argument 2 from the textbo
                    string arg3 = textBoxcategEQUIPAMENTO.Text;
                    string arg4 = textBoxtamanhoEquipamento.Text;
                    string arg5 = textBoxmatEquipaemnto.Text;
                    int arg6 = Convert.ToInt32( textBoxquantEquipamento.Text);

                    // Create a new instance of the SqlCommand
                    SqlCommand command = new SqlCommand("sp_createEquipamento", connection);
                    command.CommandType = CommandType.StoredProcedure;

                    // Add the input parameters to the command
                    command.Parameters.AddWithValue("@Cor", arg1);
                    command.Parameters.AddWithValue("@Num_identificacao_modalidade", arg2);
                    command.Parameters.AddWithValue("@Categoria", arg3);
                    command.Parameters.AddWithValue("@Tamanho", arg4);
                    command.Parameters.AddWithValue("@Material", arg5);
                    command.Parameters.AddWithValue("@Quantidade", arg6);

                    // Add other input parameters

                    // Open the database connection
                    connection.Open();

                    // Execute the command
                    command.ExecuteNonQuery();

                    // Display a success message
                    MessageBox.Show("Element created successfully!");

                    // Close the database connection
                    connection.Close();
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Error: " + ex.Message);
                }
            }
        }

        private void button1_Click_2(object sender, EventArgs e)
        {
            string connectionString = "Data Source= mednat.ieeta.pt\\SQLSERVER,8101;Initial Catalog= p8g9 ;uid= p8g9;password=MartaRafa.2021";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    string arg1 = textBoxNomeEquipamento.Text;
                    int arg3 = Convert.ToInt32(textBoxquantEquipamento.Text);

                    // Create a new instance of the SqlCommand
                    SqlCommand command = new SqlCommand("sp_updateEquipamento", connection);
                    command.CommandType = CommandType.StoredProcedure;

                    // Add the input parameters to the command
                    command.Parameters.AddWithValue("@Numero_id", arg1);
                    command.Parameters.AddWithValue("@Quantidade", arg3);

                    // Add other input parameters

                    // Open the database connection
                    connection.Open();

                    // Execute the command
                    command.ExecuteNonQuery();

                    // Display a success message
                    MessageBox.Show("Element updated successfully!");

                    // Close the database connection
                    connection.Close();
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Error: " + ex.Message);
                }
            }
        }

        private void button19_Click(object sender, EventArgs e)
        {
            string connectionString = "Data Source= mednat.ieeta.pt\\SQLSERVER,8101;Initial Catalog= p8g9 ;uid= p8g9;password=MartaRafa.2021";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    string inputValue = textBoxNomeEquipamento.Text; // Get the input value from the textbox

                    // Create a new instance of the SqlCommand
                    SqlCommand command = new SqlCommand("sp_delete_equipamento", connection);
                    command.CommandType = CommandType.StoredProcedure;

                    // Add the input parameter to the command
                    command.Parameters.AddWithValue("@id", inputValue);

                    // Open the database connection
                    connection.Open();

                    // Execute the command
                    command.ExecuteNonQuery();

                    // Display a success message
                    MessageBox.Show("Element deleted successfully!");

                    // Close the database connection
                    connection.Close();
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Error: " + ex.Message);
                }
            }
        }

        private void button12_Click(object sender, EventArgs e)
        {
            string connectionString = "Data Source= mednat.ieeta.pt\\SQLSERVER,8101;Initial Catalog= p8g9 ;uid= p8g9;password=MartaRafa.2021";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    // Create a new instance of the SqlDataAdapter
                    dataAdapter = new SqlDataAdapter();

                    // Set the SelectCommand to the stored procedure
                    dataAdapter.SelectCommand = new SqlCommand("sp_consult_material", connection);
                    dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;

                    // Create a new DataTable
                    dataTable = new DataTable();

                    // Fill the DataTable with the data from the stored procedure
                    dataAdapter.Fill(dataTable);

                    // Set the DataTable as the data source for the DataGridView
                    dataGridView3.DataSource = dataTable;
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Error: " + ex.Message);
                }
            }
        }

        private void comboBoxModalMaterial_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Get the selected item from the comboBox
            DataRowView selectedRow = (DataRowView)comboBoxModalMaterial.SelectedItem;

            // Retrieve the Num_identificacao value from the selected item
            if (selectedRow != null)
            {
                numIdentificacaoModalidade = Convert.ToInt32(selectedRow["Num_identificacao"]);
            }
        }


        private void button11_Click(object sender, EventArgs e)
        {
            string connectionString = "Data Source= mednat.ieeta.pt\\SQLSERVER,8101;Initial Catalog= p8g9 ;uid= p8g9;password=MartaRafa.2021";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    string arg1 = textBoxNomMaterial.Text;
                    int arg2 = numIdentificacaoModalidade; // Get the value of argument 2 from the textbo
                    int arg3 = Convert.ToInt32(textBoxQuantMaterial.Text);

                    // Create a new instance of the SqlCommand
                    SqlCommand command = new SqlCommand("sp_createMaterial", connection);
                    command.CommandType = CommandType.StoredProcedure;

                    // Add the input parameters to the command
                    command.Parameters.AddWithValue("@Nome", arg1);
                    command.Parameters.AddWithValue("@Num_identificacao_modalidade", arg2);
                    command.Parameters.AddWithValue("@Quantidade", arg3);

                    // Add other input parameters

                    // Open the database connection
                    connection.Open();

                    // Execute the command
                    command.ExecuteNonQuery();

                    // Display a success message
                    MessageBox.Show("Element created successfully!");

                    // Close the database connection
                    connection.Close();
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Error: " + ex.Message);
                }
            }
        }


        private void button20_Click(object sender, EventArgs e)
        {
            string connectionString = "Data Source= mednat.ieeta.pt\\SQLSERVER,8101;Initial Catalog= p8g9 ;uid= p8g9;password=MartaRafa.2021";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    string arg1 = textBoxNomMaterial.Text;
                    int arg3 = Convert.ToInt32(textBoxQuantMaterial.Text);

                    // Create a new instance of the SqlCommand
                    SqlCommand command = new SqlCommand("sp_updateMaterial", connection);
                    command.CommandType = CommandType.StoredProcedure;

                    // Add the input parameters to the command
                    command.Parameters.AddWithValue("@Nome", arg1);
                    command.Parameters.AddWithValue("@Quantidade", arg3);

                    // Add other input parameters

                    // Open the database connection
                    connection.Open();

                    // Execute the command
                    command.ExecuteNonQuery();

                    // Display a success message
                    MessageBox.Show("Element updated successfully!");

                    // Close the database connection
                    connection.Close();
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Error: " + ex.Message);
                }
            }
        }


        private void button21_Click(object sender, EventArgs e)
        {
            string connectionString = "Data Source= mednat.ieeta.pt\\SQLSERVER,8101;Initial Catalog= p8g9 ;uid= p8g9;password=MartaRafa.2021";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    string inputValue = textBoxNomMaterial.Text; // Get the input value from the textbox

                    // Create a new instance of the SqlCommand
                    SqlCommand command = new SqlCommand("sp_delete_material", connection);
                    command.CommandType = CommandType.StoredProcedure;

                    // Add the input parameter to the command
                    command.Parameters.AddWithValue("@nome", inputValue);

                    // Open the database connection
                    connection.Open();

                    // Execute the command
                    command.ExecuteNonQuery();

                    // Display a success message
                    MessageBox.Show("Element deleted successfully!");

                    // Close the database connection
                    connection.Close();
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Error: " + ex.Message);
                }
            }
        }

        private void button14_Click(object sender, EventArgs e)
        {
            string connectionString = "Data Source= mednat.ieeta.pt\\SQLSERVER,8101;Initial Catalog= p8g9 ;uid= p8g9;password=MartaRafa.2021";

            if (comboBoxTipoPessoa.SelectedItem != null && comboBoxTipoPessoa.SelectedItem.ToString() == "Funcionário")
            {

                if (comboBoxTipoFuncionar.SelectedItem != null && comboBoxTipoFuncionar.SelectedItem.ToString() == "Treinador")
                {
                    ////Fazer a consult Treinador
                    ///
                    //string connectionString = "Data Source= mednat.ieeta.pt\\SQLSERVER,8101;Initial Catalog= p8g9 ;uid= p8g9;password=MartaRafa.2021";

                    using (SqlConnection connection = new SqlConnection(connectionString))
                    {
                        try
                        {
                            // Create a new instance of the SqlDataAdapter
                            dataAdapter = new SqlDataAdapter();

                            // Set the SelectCommand to the stored procedure
                            dataAdapter.SelectCommand = new SqlCommand("sp_consult_treinador", connection);
                            //dataAdapter.SelectCommand.CommandType = CommandType.View;

                            // Create a new DataTable
                            dataTable = new DataTable();

                            // Fill the DataTable with the data from the stored procedure
                            dataAdapter.Fill(dataTable);

                            // Set the DataTable as the data source for the DataGridView
                            dataGridView1.DataSource = dataTable;
                        }
                        catch (Exception ex)
                        {
                            MessageBox.Show("Error: " + ex.Message);
                        }
                    }
                }
                else if (comboBoxTipoFuncionar.SelectedItem != null && comboBoxTipoFuncionar.SelectedItem.ToString() == "Profissional de Saúde")
                {
                    //consultar_profissional de saude
                    using (SqlConnection connection = new SqlConnection(connectionString))
                    {
                        try
                        {
                            // Create a new instance of the SqlDataAdapter
                            dataAdapter = new SqlDataAdapter();

                            // Set the SelectCommand to the stored procedure
                            dataAdapter.SelectCommand = new SqlCommand("sp_consult_pro_saude", connection);
                            //dataAdapter.SelectCommand.CommandType = CommandType.View;

                            // Create a new DataTable
                            dataTable = new DataTable();

                            // Fill the DataTable with the data from the stored procedure
                            dataAdapter.Fill(dataTable);

                            // Set the DataTable as the data source for the DataGridView
                            dataGridView1.DataSource = dataTable;
                        }
                        catch (Exception ex)
                        {
                            MessageBox.Show("Error: " + ex.Message);
                        }
                    }
                }
                else if (comboBoxTipoFuncionar.SelectedItem != null && comboBoxTipoFuncionar.SelectedItem.ToString() == "Diretor")
                {
                    //consultar diretor
                    using (SqlConnection connection = new SqlConnection(connectionString))
                    {
                        try
                        {
                            // Create a new instance of the SqlDataAdapter
                            dataAdapter = new SqlDataAdapter();

                            // Set the SelectCommand to the stored procedure
                            dataAdapter.SelectCommand = new SqlCommand("sp_consult_diretor", connection);
                            //dataAdapter.SelectCommand.CommandType = CommandType.View;

                            // Create a new DataTable
                            dataTable = new DataTable();

                            // Fill the DataTable with the data from the stored procedure
                            dataAdapter.Fill(dataTable);

                            // Set the DataTable as the data source for the DataGridView
                            dataGridView1.DataSource = dataTable;
                        }
                        catch (Exception ex)
                        {
                            MessageBox.Show("Error: " + ex.Message);
                        }
                    }
                }
                else
                {
                    //consultar funcionário
                    using (SqlConnection connection = new SqlConnection(connectionString))
                    {
                        try
                        {
                            // Create a new instance of the SqlDataAdapter
                            dataAdapter = new SqlDataAdapter();

                            // Set the SelectCommand to the stored procedure
                            dataAdapter.SelectCommand = new SqlCommand("sp_consult_funcionario", connection);
                            //dataAdapter.SelectCommand.CommandType = CommandType.View;

                            // Create a new DataTable
                            dataTable = new DataTable();

                            // Fill the DataTable with the data from the stored procedure
                            dataAdapter.Fill(dataTable);

                            // Set the DataTable as the data source for the DataGridView
                            dataGridView1.DataSource = dataTable;
                        }
                        catch (Exception ex)
                        {
                            MessageBox.Show("Error: " + ex.Message);
                        }
                    }
                }

            }
            else if (comboBoxTipoPessoa.SelectedItem != null && comboBoxTipoPessoa.SelectedItem.ToString() == "Atleta")
            {
                ////Fazer a consult Atleta
                ///
                //string connectionString = "Data Source= mednat.ieeta.pt\\SQLSERVER,8101;Initial Catalog= p8g9 ;uid= p8g9;password=MartaRafa.2021";

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    try
                    {
                        // Create a new instance of the SqlDataAdapter
                        dataAdapter = new SqlDataAdapter();

                        // Set the SelectCommand to the stored procedure
                        dataAdapter.SelectCommand = new SqlCommand("AtletasList", connection);
                        //dataAdapter.SelectCommand.CommandType = CommandType.View;

                        // Create a new DataTable
                        dataTable = new DataTable();

                        // Fill the DataTable with the data from the stored procedure
                        dataAdapter.Fill(dataTable);

                        // Set the DataTable as the data source for the DataGridView
                        dataGridView1.DataSource = dataTable;
                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show("Error: " + ex.Message);
                    }
                }
            }
            else if (comboBoxTipoPessoa.SelectedItem != null && comboBoxTipoPessoa.SelectedItem.ToString() == "Adulto Responsável")
            {
                ////Fazer a consult Adulto responsavel
                ///
                //string connectionString = "Data Source= mednat.ieeta.pt\\SQLSERVER,8101;Initial Catalog= p8g9 ;uid= p8g9;password=MartaRafa.2021";

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    try
                    {
                        // Create a new instance of the SqlDataAdapter
                        dataAdapter = new SqlDataAdapter();

                        // Set the SelectCommand to the stored procedure
                        dataAdapter.SelectCommand = new SqlCommand("sp_consult_adulto_responsavel", connection);
                        //dataAdapter.SelectCommand.CommandType = CommandType.View;

                        // Create a new DataTable
                        dataTable = new DataTable();

                        // Fill the DataTable with the data from the stored procedure
                        dataAdapter.Fill(dataTable);

                        // Set the DataTable as the data source for the DataGridView
                        dataGridView1.DataSource = dataTable;
                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show("Error: " + ex.Message);
                    }
                }
            }
            else
            {
                ////Fazer a consult Pessoa
                ///
                //string connectionString = "Data Source= mednat.ieeta.pt\\SQLSERVER,8101;Initial Catalog= p8g9 ;uid= p8g9;password=MartaRafa.2021";

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    try
                    {
                        // Create a new instance of the SqlDataAdapter
                        dataAdapter = new SqlDataAdapter();

                        // Set the SelectCommand to the stored procedure
                        dataAdapter.SelectCommand = new SqlCommand("SELECT * FROM Pessoas_VIEW", connection);
                        //dataAdapter.SelectCommand.CommandType = CommandType.View;

                        // Create a new DataTable
                        dataTable = new DataTable();

                        // Fill the DataTable with the data from the stored procedure
                        dataAdapter.Fill(dataTable);

                        // Set the DataTable as the data source for the DataGridView
                        dataGridView1.DataSource = dataTable;
                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show("Error: " + ex.Message);
                    }
                }
            }
        }

        private void button16_Click(object sender, EventArgs e)
        {
            string connectionString = "Data Source= mednat.ieeta.pt\\SQLSERVER,8101;Initial Catalog= p8g9 ;uid= p8g9;password=MartaRafa.2021";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    // Create a new instance of the SqlDataAdapter
                    dataAdapter = new SqlDataAdapter();

                    // Set the SelectCommand to the stored procedure
                    dataAdapter.SelectCommand = new SqlCommand("sp_consult_cavalo", connection);
                    dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;

                    // Create a new DataTable
                    dataTable = new DataTable();

                    // Fill the DataTable with the data from the stored procedure
                    dataAdapter.Fill(dataTable);

                    // Set the DataTable as the data source for the DataGridView
                    dataGridView2.DataSource = dataTable;
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Error: " + ex.Message);
                }
            }
        }


        private void button15_Click(object sender, EventArgs e)
        {
            string connectionString = "Data Source= mednat.ieeta.pt\\SQLSERVER,8101;Initial Catalog= p8g9 ;uid= p8g9;password=MartaRafa.2021";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {                    
                    string arg2 = textBoxNOmeBicho.Text;
                    string arg3 = textBoxTamBicho.Text;
                    string arg4 = textBoxCorBicho.Text;
                    string arg5 = textBoxPedigreeBicho.Text;

                    // Create a new instance of the SqlCommand
                    SqlCommand command = new SqlCommand("sp_createCavalo", connection);
                    command.CommandType = CommandType.StoredProcedure;

                    if (string.IsNullOrWhiteSpace(textBoxCcCavalo.Text))
                    {
                        command.Parameters.AddWithValue("@cartao_cidadao", DBNull.Value);
                    }
                    else
                    {
                        command.Parameters.AddWithValue("@cartao_cidadao", textBoxCcCavalo.Text);
                    }

                    // Add the input parameters to the command
                    //command.Parameters.AddWithValue("@cartao_cidadao", arg1);
                    command.Parameters.AddWithValue("@nome_cavalo", arg2);
                    command.Parameters.AddWithValue("@tamanho", arg3);
                    command.Parameters.AddWithValue("@cor", arg4);
                    command.Parameters.AddWithValue("@pedigree", arg5);

                    // Add other input parameters

                    // Open the database connection
                    connection.Open();

                    // Execute the command
                    command.ExecuteNonQuery();

                    // Display a success message
                    MessageBox.Show("Element created successfully!");

                    // Close the database connection
                    connection.Close();
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Error: " + ex.Message);
                }
            }
        }

        private void button25_Click(object sender, EventArgs e)
        {
            string connectionString = "Data Source= mednat.ieeta.pt\\SQLSERVER,8101;Initial Catalog= p8g9 ;uid= p8g9;password=MartaRafa.2021";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    // Create a new instance of the SqlDataAdapter
                    dataAdapter = new SqlDataAdapter();

                    // Set the SelectCommand to the stored procedure
                    dataAdapter.SelectCommand = new SqlCommand("sp_consult_equipa_assis_veterinaria", connection);
                    dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;

                    // Create a new DataTable
                    dataTable = new DataTable();

                    // Fill the DataTable with the data from the stored procedure
                    dataAdapter.Fill(dataTable);

                    // Set the DataTable as the data source for the DataGridView
                    dataGridView9.DataSource = dataTable;
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Error: " + ex.Message);
                }
            }
        }


        private void tabPage4_Click(object sender, EventArgs e)
        {
            comboBoxTipoFuncionar.Visible = false;
            labelTipoFuncionario.Visible = false;
            labelFiltrar.Visible = false;
            comboBoxAtleta.Visible = false;
            comboBoxAdulto.Visible = false;
            comboBoxFuncionário.Visible = false;
            comboBoxTreinador.Visible = false;
            comboBoxProfSaude.Visible = false;
            textBoxPesquisar.Visible = true;
            
            panelAtleta.Visible = false;
            panelAdultoResp.Visible = false;
            //panelFunc.Visible = false;
            panelProfSaude.Visible = false;
            panelPessoa.Visible = true;
            panelTreinador.Visible = false;
            panelDiretor.Visible = false;
        }

        private void comboBox10_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (comboBoxTipoFuncionar.SelectedItem.ToString()!= null && comboBoxTipoPessoa.SelectedItem.ToString() == "Funcionário" && comboBoxTipoFuncionar.SelectedItem.ToString() == "Treinador")
            {
                comboBoxTipoFuncionar.Visible = true;
                labelTipoFuncionario.Visible = true;
                labelFiltrar.Visible = true;
                comboBoxTreinador.Visible = true;
                comboBoxProfSaude.Visible = false;
                comboBoxFuncionário.Visible = false;
                comboBoxAtleta.Visible = false;
                comboBoxAdulto.Visible = false;

                panelAtleta.Visible = false;
                panelAdultoResp.Visible = false;
                //panelFunc.Visible = false;
                panelProfSaude.Visible = false;
                panelPessoa.Visible = false;
                panelTreinador.Visible = true;
                textBoxPesquisar.Visible = true;
                panelDiretor.Visible = false;

            }
            else if (comboBoxTipoFuncionar.SelectedItem.ToString() != null && comboBoxTipoPessoa.SelectedItem.ToString() == "Funcionário" && comboBoxTipoFuncionar.SelectedItem.ToString() == "Profissional de Saúde")
            {
                comboBoxTipoFuncionar.Visible = true;
                labelTipoFuncionario.Visible = true;
                labelFiltrar.Visible = true;
                comboBoxTreinador.Visible = false;
                comboBoxProfSaude.Visible = true;
                comboBoxFuncionário.Visible = false;
                comboBoxAtleta.Visible = false;
                comboBoxAdulto.Visible = false;

                panelAtleta.Visible = false;
                panelAdultoResp.Visible = false;
                //panelFunc.Visible = false;
                panelProfSaude.Visible = true;
                panelPessoa.Visible = false;
                panelTreinador.Visible = false;
                textBoxPesquisar.Visible = true;
                panelDiretor.Visible = false;


            }
            else if (comboBoxTipoFuncionar.SelectedItem.ToString()!= null && comboBoxTipoPessoa.SelectedItem.ToString() == "Funcionário" && comboBoxTipoFuncionar.SelectedItem.ToString() == "Diretor")
            {
                comboBoxTipoFuncionar.Visible = true;
                labelTipoFuncionario.Visible = true;
                labelFiltrar.Visible = false;
                comboBoxTreinador.Visible = false;
                comboBoxProfSaude.Visible = false;
                comboBoxFuncionário.Visible = false;
                comboBoxAtleta.Visible = false;
                comboBoxAdulto.Visible = false;

                panelAtleta.Visible = false;
                panelAdultoResp.Visible = false;
                //panelFunc.Visible = false;
                panelProfSaude.Visible = false;
                panelPessoa.Visible = false;
                panelTreinador.Visible = false;
                textBoxPesquisar.Visible = false;
                panelDiretor.Visible = true;


            }
            else
            {
                comboBoxTipoFuncionar.Visible = true;
                labelTipoFuncionario.Visible = true;
                labelFiltrar.Visible = true;
                
                comboBoxAtleta.Visible = false;
                comboBoxAdulto.Visible = false;
                comboBoxFuncionário.Visible = true;

                comboBoxTreinador.Visible = false;
                comboBoxProfSaude.Visible = false;

                panelAtleta.Visible = false;
                panelAdultoResp.Visible = false;
                //panelFunc.Visible = true;
                panelProfSaude.Visible = false;
                panelPessoa.Visible = false;
                panelTreinador.Visible = false;
                textBoxPesquisar.Visible = true;
                panelDiretor.Visible = false;


            }
        }

        private void comboBox9_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (comboBoxTipoPessoa.SelectedItem.ToString() != null && comboBoxTipoPessoa.SelectedItem.ToString() == "Funcionário")
            {
                comboBoxTipoFuncionar.Visible = true;
                labelTipoFuncionario.Visible = true;

                comboBoxAtleta.Visible = false;
                comboBoxAdulto.Visible = false;
                comboBoxTreinador.Visible = false;
                comboBoxProfSaude.Visible = false;

                labelFiltrar.Visible = true;
                comboBoxFuncionário.Visible = true;

                panelAtleta.Visible = false;
                panelAdultoResp.Visible = false;
                //panelFunc.Visible = true;
                panelProfSaude.Visible = false;
                panelPessoa.Visible = false;
                panelTreinador.Visible = false;
                textBoxPesquisar.Visible = true;
                panelDiretor.Visible = false;



            }
            else if (comboBoxTipoPessoa.SelectedItem.ToString() != null && comboBoxTipoPessoa.SelectedItem.ToString() == "Atleta")
            {
                comboBoxTipoFuncionar.Visible = false;
                labelTipoFuncionario.Visible = false;

                labelFiltrar.Visible = true;
                comboBoxAtleta.Visible = true;
                comboBoxTreinador.Visible = false;
                comboBoxProfSaude.Visible = false;

                comboBoxAdulto.Visible = false;
                comboBoxFuncionário.Visible = false;

                panelAtleta.Visible = true;
                panelAdultoResp.Visible = false;
                //panelFunc.Visible = false;
                panelProfSaude.Visible = false;
                panelPessoa.Visible = false;
                panelTreinador.Visible = false;
                textBoxPesquisar.Visible = true;
                panelDiretor.Visible = false;


            }
            else if (comboBoxTipoPessoa.SelectedItem.ToString() != null && comboBoxTipoPessoa.SelectedItem.ToString() == "Adulto Responsável")
            {
                comboBoxTipoFuncionar.Visible = false;
                comboBoxAtleta.Visible = false;
                comboBoxAdulto.Visible = true;
                labelFiltrar.Visible = true;
                labelTipoFuncionario.Visible = false;
                comboBoxFuncionário.Visible = false;
                comboBoxTreinador.Visible = false;
                comboBoxProfSaude.Visible = false;

                panelAtleta.Visible = false;
                panelAdultoResp.Visible = true;
                //panelFunc.Visible = false;
                panelProfSaude.Visible = false;
                panelPessoa.Visible = false;
                panelTreinador.Visible = false;
                textBoxPesquisar.Visible = true;
                panelDiretor.Visible = false;
            }
            else
            {
                comboBoxTipoFuncionar.Visible = false;
                labelTipoFuncionario.Visible = false;
                labelFiltrar.Visible = false;
                comboBoxAtleta.Visible = false;
                comboBoxAdulto.Visible = false;
                comboBoxFuncionário.Visible = false;
                comboBoxTreinador.Visible = false;
                comboBoxProfSaude.Visible = false;


                panelAtleta.Visible = false;
                panelAdultoResp.Visible = false;
                //panelFunc.Visible = false;
                panelProfSaude.Visible = false;
                panelPessoa.Visible = true;
                panelTreinador.Visible = false;
                textBoxPesquisar.Visible = true;
                panelDiretor.Visible = false;


            }
        }

        //private void comboBoxEscalaoTreinador_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    // Get the selected item from the comboBox
        //    DataRowView selectedRow = (DataRowView)comboBoxEscalaoTreinador.SelectedItem;

        //    // Retrieve the Num_identificacao value from the selected item
        //    if (selectedRow != null)
        //    {
        //        nomeEscalao = Convert.ToInt32(selectedRow["N"]);
        //    }
        //}

        private void button13_Click(object sender, EventArgs e)
        {
            string connectionString = "Data Source= mednat.ieeta.pt\\SQLSERVER,8101;Initial Catalog= p8g9 ;uid= p8g9;password=MartaRafa.2021";


            if (comboBoxTipoPessoa.SelectedItem != null && comboBoxTipoPessoa.SelectedItem.ToString() == "Funcionário")
            {

                if (comboBoxTipoFuncionar.SelectedItem != null && comboBoxTipoFuncionar.SelectedItem.ToString() == "Treinador")
                {
                    ////Fazer a consult Treinador

                    using (SqlConnection connection = new SqlConnection(connectionString))
                    {
                        try
                        {
                            string arg1 = textBoxNomeTreinador.Text;
                            string arg3 = textBoxGenTreinador.Text;
                            string arg4 = textBoxCCTreinador.Text;
                            string arg5 = textBoxTelTreinador.Text;
                            string arg6 = textBoxEmailTreinador.Text;
                            int arg7 = Convert.ToInt32( textBoxNumTreinador.Text);
                            int arg8 = Convert.ToInt32( textBoxSalTreinador.Text);
                            string arg9 = comboBoxEscalaoTreinador.SelectedValue.ToString();



                            // Create a new instance of the SqlCommand
                            SqlCommand command = new SqlCommand("sp_createTreinador", connection);
                            command.CommandType = CommandType.StoredProcedure;

                            // Add the input parameters to the command
                            command.Parameters.AddWithValue("@nome", arg1);
                            command.Parameters.AddWithValue("@genero", arg3);
                            command.Parameters.AddWithValue("@cartao_cidadao", arg4);
                            command.Parameters.AddWithValue("@telemovel", arg5);
                            command.Parameters.AddWithValue("@email", arg6);
                            command.Parameters.AddWithValue("@num_funcionario", arg7);
                            command.Parameters.AddWithValue("@equipavet", DBNull.Value);
                            command.Parameters.AddWithValue("@salario", arg8);
                            command.Parameters.AddWithValue("@nome_escalao", arg9);

                            // Add other input parameters

                            // Open the database connection
                            connection.Open();

                            // Execute the command
                            command.ExecuteNonQuery();

                            // Display a success message
                            MessageBox.Show("Element created successfully!");

                            // Close the database connection
                            connection.Close();
                        }
                        catch (Exception ex)
                        {
                            MessageBox.Show("Error: " + ex.Message);
                        }
                    }
                }
                else if (comboBoxTipoFuncionar.SelectedItem != null && comboBoxTipoFuncionar.SelectedItem.ToString() == "Profissional de Saúde")
                {
                    //consultar_profissional de saude
                    using (SqlConnection connection = new SqlConnection(connectionString))
                    {
                        try
                        {
                            string arg1 = textBoxNomeProfSaude.Text;
                            string arg3 = textBoxGenProfSaude.Text;
                            string arg4 = textBoxCCProfSaude.Text;
                            string arg5 = textBoxTelProfSaude.Text;
                            string arg6 = textBoxEmailProfSaude.Text;
                            int arg7 = Convert.ToInt32(textBoxNumProfSaude.Text);
                            int arg8 = Convert.ToInt32(textBoxSalProfSaude.Text);
                            string arg9 = comboBoxCargoProfSaude.SelectedValue.ToString();
                            int arg10 = Convert.ToInt32(textBoxCedulaProfSaude);
                            string arg11 = comboBoxEscaloProfSaude.SelectedValue.ToString();





                            // Create a new instance of the SqlCommand
                            SqlCommand command = new SqlCommand("sp_createProSaude", connection);
                            command.CommandType = CommandType.StoredProcedure;

                            // Add the input parameters to the command
                            command.Parameters.AddWithValue("@nome", arg1);
                            command.Parameters.AddWithValue("@genero", arg3);
                            command.Parameters.AddWithValue("@cartao_cidadao", arg4);
                            command.Parameters.AddWithValue("@telemovel", arg5);
                            command.Parameters.AddWithValue("@email", arg6);
                            command.Parameters.AddWithValue("@num_funcionario", arg7);
                            command.Parameters.AddWithValue("@equipavet", DBNull.Value);
                            command.Parameters.AddWithValue("@salario", arg8);
                            command.Parameters.AddWithValue("@nome_escalao", arg11);
                            command.Parameters.AddWithValue("@num_cedula_profissional", arg10);
                            command.Parameters.AddWithValue("@cargo", arg11);


                            // Add other input parameters

                            // Open the database connection
                            connection.Open();

                            // Execute the command
                            command.ExecuteNonQuery();

                            // Display a success message
                            MessageBox.Show("Element created successfully!");

                            // Close the database connection
                            connection.Close();
                        }
                        catch (Exception ex)
                        {
                            MessageBox.Show("Error: " + ex.Message);
                        }
                    }
                }
                else if (comboBoxTipoFuncionar.SelectedItem != null && comboBoxTipoFuncionar.SelectedItem.ToString() == "Diretor")
                {
                }
                else
                {
                    //consultar funcionário

                    using (SqlConnection connection = new SqlConnection(connectionString))
                    {
                        try
                        {
                            string arg1 = textBoxNomeFuncionario.Text;
                            string arg3 = textBoxGenFuncionario.Text;
                            string arg4 = textBoxCCFuncionario.Text;
                            string arg5 = textBoxTelFuncionario.Text;
                            string arg6 = textBoxEmailFuncionario.Text;
                            int arg7 = Convert.ToInt32(textBoxNumFuncionario.Text);
                            int arg8 = Convert.ToInt32(textBoxSalFuncionario.Text);
                            string arg9 = textBoxEquipaVetFuncionario.Text;



                            // Create a new instance of the SqlCommand
                            SqlCommand command = new SqlCommand("sp_createFuncionario", connection);
                            command.CommandType = CommandType.StoredProcedure;

                            // Add the input parameters to the command
                            command.Parameters.AddWithValue("@nome", arg1);
                            command.Parameters.AddWithValue("@genero", arg3);
                            command.Parameters.AddWithValue("@cartao_cidadao", arg4);
                            command.Parameters.AddWithValue("@telemovel", arg5);
                            command.Parameters.AddWithValue("@email", arg6);
                            command.Parameters.AddWithValue("@num_funcionario", arg7);
                            command.Parameters.AddWithValue("@equipavet", arg9);
                            command.Parameters.AddWithValue("@salario", arg8);

                            // Add other input parameters

                            // Open the database connection
                            connection.Open();

                            // Execute the command
                            command.ExecuteNonQuery();

                            // Display a success message
                            MessageBox.Show("Element created successfully!");

                            // Close the database connection
                            connection.Close();
                        }
                        catch (Exception ex)
                        {
                            MessageBox.Show("Error: " + ex.Message);
                        }
                    }
                }

            }
            else if (comboBoxTipoPessoa.SelectedItem != null && comboBoxTipoPessoa.SelectedItem.ToString() == "Atleta")
            {
                ////Fazer a consult Atleta
                ///
                //string connectionString = "Data Source= mednat.ieeta.pt\\SQLSERVER,8101;Initial Catalog= p8g9 ;uid= p8g9;password=MartaRafa.2021";

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    try
                    {
                        string arg1 = textBoxNomeAtleta.Text;
                        string arg2 = textBoxGeneroAtleta.Text;
                        string arg3 = textBoxCCAtleta.Text;
                        string arg4 = textBoxContactoAtleta.Text;
                        string arg5 = textBoxEmailAtleta.Text;
                        string arg6 = textBoxDeclaracaoMed.Text;
                        string arg7 = textBoxBancoAtleta.Text;
                        string arg8 = textBoxIdadeAtleta.Text;
                        string arg9 = comboBoxEscalAtleta.SelectedValue.ToString();
                        string arg10 = textBoxgenrespatl.Text;
                        string arg11 = textBoxNomRespAtleta.Text;
                        string arg12 = textBoxCCrespatl.Text;
                        string arg13 = textBoxtelrespatl.Text;
                        string arg14 = textBoxemailrespatl.Text;
                        string arg15 = textBoxparentesco.Text;
                        string arg16 = textBoxdatain.Text;
                        string arg17 = textBoxdataout.Text;




                        // Create a new instance of the SqlCommand
                        SqlCommand command = new SqlCommand("sp_createAtleta", connection);
                        command.CommandType = CommandType.StoredProcedure;

                        // Add the input parameters to the command
                        command.Parameters.AddWithValue("@nome", arg1);
                        command.Parameters.AddWithValue("@genero", arg2);
                        command.Parameters.AddWithValue("@cartao_cidacao", arg3);
                        command.Parameters.AddWithValue("@telemovel", arg4);
                        command.Parameters.AddWithValue("@email", arg5);
                        command.Parameters.AddWithValue("@declaracao_medica", arg6);
                        command.Parameters.AddWithValue("@ref_transacao_bancaria", arg7);
                        command.Parameters.AddWithValue("@idade", arg8);
                        command.Parameters.AddWithValue("@nome_escalao", arg9);
                        command.Parameters.AddWithValue("@genero_responsavel", arg10);
                        command.Parameters.AddWithValue("@nome_responsavel", arg11);
                        command.Parameters.AddWithValue("@cartao_cidadao_responsavel", arg12);
                        command.Parameters.AddWithValue("@telemovel_responsavel", arg13);
                        command.Parameters.AddWithValue("@email_responsavel", arg14);
                        command.Parameters.AddWithValue("@parentesco", arg15);
                        command.Parameters.AddWithValue("@data_in", arg16);
                        command.Parameters.AddWithValue("@data_out", arg17);


                        // Add other input parameters

                        // Open the database connection
                        connection.Open();

                        // Execute the command
                        command.ExecuteNonQuery();

                        // Display a success message
                        MessageBox.Show("Element created successfully!");

                        // Close the database connection
                        connection.Close();
                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show("Error: " + ex.Message);
                    }
                }
            }
            else if (comboBoxTipoPessoa.SelectedItem != null && comboBoxTipoPessoa.SelectedItem.ToString() == "Adulto Responsável")
            {
                ////Fazer a consult Adulto responsavel

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    try
                    {
                        string arg1 = textBoxAdultResp.Text;
                        string arg2 = textBoxGenAdultoResp.Text;
                        string arg3 = textBoxCCAdultoResp.Text;
                        string arg4 = textBoxTelAdultoResp.Text;
                        string arg5 = textBoxEmailAdultoResp.Text;
                        string arg6 = textBoxParentescoAdultoResp.Text;
                        string arg7 = textBoxdataInAdultoResp.Text;
                        string arg8 = textBoxdataOutAdultoResp.Text;
                        string arg9 = textBoxCcatl_Resp.Text;




                        // Create a new instance of the SqlCommand
                        SqlCommand command = new SqlCommand("sp_createAdultoResponsavel", connection);
                        command.CommandType = CommandType.StoredProcedure;

                        // Add the input parameters to the command
                        command.Parameters.AddWithValue("@cartao_cidadao", arg9);
                        command.Parameters.AddWithValue("@genero", arg2);
                        command.Parameters.AddWithValue("@nome_responsavel", arg1);
                        command.Parameters.AddWithValue("@cartao_cidadao_responsavel", arg3);
                        command.Parameters.AddWithValue("@telemovel_responsavel", arg4);
                        command.Parameters.AddWithValue("@email_responsavel", arg5);
                        command.Parameters.AddWithValue("@parentesco", arg6);
                        command.Parameters.AddWithValue("@data_in", arg7);
                        command.Parameters.AddWithValue("@data_out", arg8);


                        // Add other input parameters

                        // Open the database connection
                        connection.Open();

                        // Execute the command
                        command.ExecuteNonQuery();

                        // Display a success message
                        MessageBox.Show("Element created successfully!");

                        // Close the database connection
                        connection.Close();
                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show("Error: " + ex.Message);
                    }
                }
            }
            else
            {
                ////Criar uma Pessoa
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    try
                    {
                        string arg1 = textBoxNomeAtleta.Text;
                        string arg2 = textBoxGeneroAtleta.Text;
                        string arg3 = textBoxCCAtleta.Text;
                        string arg4 = textBoxContactoAtleta.Text;
                        string arg5 = textBoxEmailAtleta.Text;

                        // Create a new instance of the SqlCommand
                        SqlCommand command = new SqlCommand("sp_createPessoa", connection);
                        command.CommandType = CommandType.StoredProcedure;

                        // Add the input parameters to the command
                        command.Parameters.AddWithValue("@nome", arg1);
                        command.Parameters.AddWithValue("@genero", arg2);
                        command.Parameters.AddWithValue("@cartao_cidadao", arg3);
                        command.Parameters.AddWithValue("@telemovel", arg4);
                        command.Parameters.AddWithValue("@email", arg5);

                        // Add other input parameters

                        // Open the database connection
                        connection.Open();

                        // Execute the command
                        command.ExecuteNonQuery();

                        // Display a success message
                        MessageBox.Show("Element created successfully!");

                        // Close the database connection
                        connection.Close();
                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show("Error: " + ex.Message);
                    }
                }
            }
        }

        private void button22_Click(object sender, EventArgs e)
        {
        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void label22_Click(object sender, EventArgs e)
        {

        }

        private void textBox20_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox20_TextChanged_1(object sender, EventArgs e)
        {

        }

        private void tabPage5_Click(object sender, EventArgs e)
        {

        }

        private void comboBox5_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void dataGridView7_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void dataGridView6_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void dataGridView5_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void labelAtleta_Click(object sender, EventArgs e)
        {

        }

        private void textBoxCCFuncionario_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBoxCCAdultoResp_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBoxParentescoAdultoResp_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox21_TextChanged(object sender, EventArgs e)
        {

        }

        private void button22_Click_1(object sender, EventArgs e)
        {
            string connectionString = "Data Source= mednat.ieeta.pt\\SQLSERVER,8101;Initial Catalog= p8g9 ;uid= p8g9;password=MartaRafa.2021";


            if (comboBoxTipoPessoa.SelectedItem != null && comboBoxTipoPessoa.SelectedItem.ToString() == "Funcionário")
            {

                if (comboBoxTipoFuncionar.SelectedItem != null && comboBoxTipoFuncionar.SelectedItem.ToString() == "Treinador")
                {
                    ////Fazer eliminar treinador Treinador
                    using (SqlConnection connection = new SqlConnection(connectionString))
                    {
                        try
                        {
                            string inputValueCC = textBoxCCTreinador.Text; // Get the input value from the textbox

                            // Create a new instance of the SqlCommand
                            SqlCommand command = new SqlCommand("sp_delete_treinador", connection);
                            command.CommandType = CommandType.StoredProcedure;

                            // Add the input parameter to the command
                            command.Parameters.AddWithValue("@cc", inputValueCC);

                            // Open the database connection
                            connection.Open();

                            // Execute the command
                            command.ExecuteNonQuery();

                            // Display a success message
                            MessageBox.Show("Element deleted successfully!");

                            // Close the database connection
                            connection.Close();
                        }
                        catch (Exception ex)
                        {
                            MessageBox.Show("Error: " + ex.Message);
                        }
                    }


                }
                else if (comboBoxTipoFuncionar.SelectedItem != null && comboBoxTipoFuncionar.SelectedItem.ToString() == "Profissional de Saúde")
                {
                    //consultar_profissional de saude

                }
                else if (comboBoxTipoFuncionar.SelectedItem != null && comboBoxTipoFuncionar.SelectedItem.ToString() == "Diretor")
                {

                }
                else
                {
                    //consultar funcionário

                }

            }
            else if (comboBoxTipoPessoa.SelectedItem != null && comboBoxTipoPessoa.SelectedItem.ToString() == "Atleta")
            {
                ////Fazer a consult Atleta
                ////Fazer eliminar treinador Treinador
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    try
                    {
                        string inputValueCC = textBoxCCAtleta.Text; // Get the input value from the textbox

                        // Create a new instance of the SqlCommand
                        SqlCommand command = new SqlCommand("sp_delete_atleta", connection);
                        command.CommandType = CommandType.StoredProcedure;

                        // Add the input parameter to the command
                        command.Parameters.AddWithValue("@cc", inputValueCC);

                        // Open the database connection
                        connection.Open();

                        // Execute the command
                        command.ExecuteNonQuery();

                        // Display a success message
                        MessageBox.Show("Element deleted successfully!");

                        // Close the database connection
                        connection.Close();
                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show("Error: " + ex.Message);
                    }
                }
            }
            else if (comboBoxTipoPessoa.SelectedItem != null && comboBoxTipoPessoa.SelectedItem.ToString() == "Adulto Responsável")
            {
                ////Fazer a consult Adulto responsavel
                ////Fazer eliminar treinador Treinador
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    try
                    {
                        string inputValueCC = textBoxCCAdultoResp.Text; // Get the input value from the textbox

                        // Create a new instance of the SqlCommand
                        SqlCommand command = new SqlCommand("sp_delete_adulto_responsavel", connection);
                        command.CommandType = CommandType.StoredProcedure;

                        // Add the input parameter to the command
                        command.Parameters.AddWithValue("@cc", inputValueCC);

                        // Open the database connection
                        connection.Open();

                        // Execute the command
                        command.ExecuteNonQuery();

                        // Display a success message
                        MessageBox.Show("Element deleted successfully!");

                        // Close the database connection
                        connection.Close();
                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show("Error: " + ex.Message);
                    }
                }

            }
            else
            {


            }
        }

        private void textBox1_TextChanged_1(object sender, EventArgs e)
        {
            try
            {
                string searchColumn = comboBox1.SelectedItem.ToString();
                string searchText = textBox1.Text;
                loadData(searchColumn, searchText);
            }
            catch
            {
                MessageBox.Show("Erro: \r\n" +  MessageBoxButtons.OK);
            }
        }

        private void loadData(string searchColumn = "", string searchText="")
        {
            SqlConnection CN = new SqlConnection("Data Source = mednat.ieeta.pt\\SQLSERVER, 8101; Initial Catalog = p8g9; uid = p8g9; password = MartaRafa.2021");
            CN.Open();
            string query = "SELECT * FROM INSTALACAO";

            if(!string.IsNullOrEmpty(searchColumn) && !string.IsNullOrEmpty(searchText))
            {
                query += " WHERE " + searchColumn + " LIKE '%" + searchText + "%'" ;
            }

            SqlCommand cmd = new SqlCommand(query, CN);

            DataTable detailsTable = new DataTable();
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(cmd);

            sqlDataAdapter.Fill(detailsTable);
            dataGridView1.DataSource = detailsTable;
            dataGridView1.Visible = true;
            CN.Close();
        }

        private void comboBox2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void textBox2_TextChanged(object sender, EventArgs e)
        {
            try
            {
                string searchColumn = comboBox2.SelectedItem.ToString();
                string searchText = textBox2.Text;
                loadData2(searchColumn, searchText);
            }
            catch
            {
                MessageBox.Show("Erro: \r\n" + MessageBoxButtons.OK);
            }
        }

        private void loadData2(string searchColumn = "", string searchText = "")
        {
            SqlConnection CN = new SqlConnection("Data Source = mednat.ieeta.pt\\SQLSERVER, 8101; Initial Catalog = p8g9; uid = p8g9; password = MartaRafa.2021");
            CN.Open();
            string query = "SELECT * FROM MODALIDADE";

            if (!string.IsNullOrEmpty(searchColumn) && !string.IsNullOrEmpty(searchText))
            {
                query += " WHERE " + searchColumn + " LIKE '%" + searchText + "%'";
            }

            SqlCommand cmd = new SqlCommand(query, CN);

            DataTable detailsTable = new DataTable();
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(cmd);

            sqlDataAdapter.Fill(detailsTable);
            dataGridView1.DataSource = detailsTable;
            dataGridView1.Visible = true;
            CN.Close();
        }
    }
}
