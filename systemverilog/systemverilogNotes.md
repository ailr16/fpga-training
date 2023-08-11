# SystemVerilog Notes

## SystemVerilog Variables

### 2-state Data Types (0, 1)
|Type    | Additional info |
|--------|-----------------|
|bit     |                 |
|byte    |8b               |  
|shortint|16b              |
|int     |32b              |
|longint |64b              |

### 4-state Data Types (0, 1, x, z)
|Type    | Additional info |
|--------|-----------------|
|logic   |                 |
|reg     |                 |  
|integer |32b              |
|time    |65bU             |

### Logic Data Type
- Replace *reg*
- Use *net* with multiple drivers
- Use *logic* everywhere else
```v
logic data_wire, data_reg;
always_comb
    case (sel)
        1'b0 : data_wire = datain;
        1'b1 : data_wire = ~datain;
    endcase

always_ff @(posedge clk)
    data_reg <= datain;
```

### Casting
- Static casting: 
    - Converts one data type to another compatible data types
    - Not applicable to OOP
    - Use the ‘ operator
    ```v
    10´(x-2)            //Casting to change size
    int´(2.0 * 3.0)     //Casting to type int
    fruit´(0)           //Casting to enum fruit
    ```

### User-Defined Types
- Type definitions:
    ```v
    typedef int unsigned uint;
    typedef logic [15:0] main_bus;
    ```

- Type definitions:
    - Specific set of values
    ```v
    typedef enum bit {TRUE, FALSE} boolean;

    boolean rdy;

    assign eq_two = (datain == 2'b10) ? TRUE: FALSE;
    ```

### User-Defined Types - Structures
- Collection of different variables defined as a single name
    ```v
    typedef struct{
        logic       even;
        logic [7:0] parity;
    }par_struct;

    par_struct par_in, par_out;

    assign par_in = '{0, 8'h80};

    assign par_out.even   = 1'b1;
    assign par_out.parity = 8'h55;
    ```
### Arrays
- Collection of variables of same type defined as a single name
    ```v
    logic [7:0] data_mem [1:4][1:256];
    /*
    Data type
    Packed dimensions
    Array name
    Unpacked dimensions
    */
    assign  data_mem[1][100][7:0] = 8'h55;
    assign  data_mem[2][80:81] = '{8'h5, 8'ha};
    ```

### Array Reduction Methods
- Applicable to to any unpacked array to reducte it to a single value:
    - sum()
    - product()
    - and()
    - or()
    - xor()
    ```v
    byte data[2:0] = '{1, 3, 5};
    int result;

    assign result = data.sum;
    assign result = data.product;
    assign result = data.and;
    ```

### Unsized Integer Literals
- Example
    ```v
    module sv_test #(parameter REG_WIDTH = 8)
            ( input  clk, set,
              input  [REG_WIDTH-1:0] data_in,
              output [REG_WIDTH-1:0] data_out);
    
    logic [REG_WIDTH-1:0] data_reg,

    always_ff @ (posedge clk, posedge set)
        if(set)
            data_reg <= '1;     //Automatically scales regardless of the value of REG_WIDTH
        else
            data_reg <= data_in;

    assign data_out = data_reg;

    endmodule    
    ```

#### NOTE: Notes based in *SystemVerilog with the Quartus II Software, Altera, Intel training*