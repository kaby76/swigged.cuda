using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Swigged.cuda;

namespace ConsoleApp1
{
    class Program
    {
        static void Main(string[] args)
        {
            Swigged.cuda.cuda.cuInit(0);
        }
    }
}
