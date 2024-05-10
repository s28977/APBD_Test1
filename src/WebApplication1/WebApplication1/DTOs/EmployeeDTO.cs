using System.ComponentModel.DataAnnotations;

namespace WebApplication1.Models;

public class EmployeeDto
{
    [Required]
    [MaxLength(200)]
    public string Fullname { get; set; }
    
    [Required]
    [MaxLength(200)]
    public string Email { get; set; }
}