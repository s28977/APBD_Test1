using WebApplication1.Models;

namespace WebApplication1.Repositories;

public interface IEmployeeRepository
{
    Task<bool> Add(EmployeeDto employee);
}