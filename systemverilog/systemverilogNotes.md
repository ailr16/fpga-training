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
- Type definitions:
    - Collection of variables defined as a single name
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

#### NOTE: Notes based in *SystemVerilog with the Quartus II Software, Altera, Intel training*