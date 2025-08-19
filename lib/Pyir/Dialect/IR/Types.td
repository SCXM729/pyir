#ifndef PYIR_DIALECT_IR_TYPES_TD
#define PYIR_DIALECT_IR_TYPES_TD

include "Dialect.td"
include "mlir/IR/Traits.td"
include "mlir/IR/AttrTypeBase.td"
include "mlir/IR/BuiltinTypeInterfaces.td"
include "Pyir/Interfaces/FPTypeInterface.td"

class Pyir_Type<string name, string typeMnemonic, list<Trait> traits = [], 
               string baseCppClass = "::mlir::Type">
    : TypeDef<Pyir_Dialect, name, traits, baseCppClass> {
  let mnemonic = typeMnemonic;
  let typeName = dialect.name # "." # typeMnemonic;
}

//===----------------------------------------------------------------------===//
// ClassType
//===----------------------------------------------------------------------===//

// def Pyir_ClassType: Pyir_Type<Pyir_Dialect, CPred<"::llvm::isa<PyirClassType>($_self)">, "PyIR class type">;

def Pyir_ClassType: Pyir_Type<"Class", "class">{
  let summary = "class type";
  let parameters = (ins 
    "mlir::StringAttr":$name
  );
  let genStorageClass = 0 ;
  // let storageClass = "ClassTypeStorage";
  let assemblyFormat= "`<` $name `>`";
}

//===----------------------------------------------------------------------===//
// IntType
//===----------------------------------------------------------------------===//

def Pyir_IntType : Pyir_Type<"Int", "int"> {
  let summary = "int type";
  // let hasCustomAssemblyFormat = 1;
}


//===----------------------------------------------------------------------===//
// FloatType
//===----------------------------------------------------------------------===//

def Pyir_FloatType : Pyir_Type<"Float", "float"> {
  let summary = "float type";
}

//===----------------------------------------------------------------------===//
// BoolType
//===----------------------------------------------------------------------===//

def Pyir_BoolType : Pyir_Type<"Bool", "bool"> {
  let summary = "bool type";
}

//===----------------------------------------------------------------------===//
// StringType
//===----------------------------------------------------------------------===//

def Pyir_StringType : Pyir_Type<"String", "string"> {
  let summary = "string type";
}

//===----------------------------------------------------------------------===//
// ListType
//===----------------------------------------------------------------------===//

def Pyir_ListType : Pyir_Type<"List", "list"> {
  let summary = "list type";
}

//===----------------------------------------------------------------------===//
// DictType
//===----------------------------------------------------------------------===//

def Pyir_DictType : Pyir_Type<"Dict", "dict"> {
  let summary = "dict type";
}

//===----------------------------------------------------------------------===//
// TupleType
//===----------------------------------------------------------------------===//

def Pyir_TupleType : Pyir_Type<"Tuple", "tuple"> {
  let summary = "tuple type";
}

//===----------------------------------------------------------------------===//
// NoneType
//===----------------------------------------------------------------------===//

def Pyir_NoneType : Pyir_Type<"None", "none"> {
  let summary = "none type";
}


//===----------------------------------------------------------------------===//
// ModuleType (for Python modules)
//===----------------------------------------------------------------------===//

def Pyir_ModuleType : Pyir_Type<"Module", "module"> {
  let summary = "module type";
}

//===----------------------------------------------------------------------===//
// Global type constraints
//===----------------------------------------------------------------------===//

def Pyir_AnyType : AnyTypeOf<[
  Pyir_BoolType, Pyir_IntType,
  Pyir_StringType, Pyir_ListType, Pyir_DictType, 
  Pyir_TupleType, Pyir_NoneType, Pyir_ModuleType
]>;
#endif
