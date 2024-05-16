/// Standard constants
pub const PUSH_STR: &str = "@SP\nA=M\nM=D\n@SP\nM=M+1";
pub const BASE_TEMP_SEGMENT: u128 = 5;
pub const POP_A: &str = "R13";
pub const POP_B: &str = "R14";
pub const PUSH_A: &str = "R15";
pub const SP_A: &str = "SP";

// Numerical Constants
pub const SP_AM: u32 = 256;

// Comments constants
pub const VM_COMMENT: &str = "// ** VM--CODE; x low level requirement **";

static POINTER_MAPPINGS: phf::Map<&'static str, &'static str> = phf::phf_map! {
    "local" => "LCL",
    "argument" => "ARG",
    "this" => "THIS",
    "that" => "THAT"
};

pub fn get_pointer_mapping(raw_kw: &str) -> Result<&&str, &str> {
    POINTER_MAPPINGS.get(raw_kw).ok_or(raw_kw)
}
