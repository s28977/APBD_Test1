using System.ComponentModel.DataAnnotations;

namespace WebApplication1.Models;

public class Employee
{
    public int Id { get; set; }
    public required string Fullname { get; set; }
    public required string Email { get; set; }
}