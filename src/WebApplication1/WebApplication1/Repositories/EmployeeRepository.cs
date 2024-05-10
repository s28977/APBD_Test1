using Microsoft.Data.SqlClient;
using WebApplication1.Models;

namespace WebApplication1.Repositories;

public class EmployeeRepository(string connectionString) : IEmployeeRepository
{
    public async Task<bool> Add(EmployeeDto employee)
    {
        const string insertString = "INSERT INTO Employee(Id, Fullname, Email) VALUES ((Select coalesce(max(Id), 0) + 1 from Employee), @Fullname, @Email)";
        var countRowsAdded = -1;
        await using (SqlConnection connection = new SqlConnection(connectionString)) 
        {
            await using (SqlCommand command = new(insertString, connection))
            {
                command.Parameters.AddWithValue("Fullname", employee.Fullname);
                command.Parameters.AddWithValue("Email", employee.Email);
                await connection.OpenAsync();
                countRowsAdded = await command.ExecuteNonQueryAsync();
            }
        }
    
        return countRowsAdded != -1;
    }
}