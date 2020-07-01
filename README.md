# Module Expansion and Variable Validation Demos

This repository includes small demos demonstrating module expansion
(using module `for_each`) and variable validation, features that
are available in the 0.13 major release of Terraform.

## Module Expansion

Module expansion in Terraform encompasses using the `count`, `for_each`, or
`depends_on` keywords in a module call block:

```hcl
module "foo" {
    source = "./mymodule"
    count  = 2
}
```

It is called module expansion because one module may _expand_ to multiple
module _instances_. `depends_on`, while not expanding, relies on the same 
infrastructure as `count` and `for_each`.

## Variable Validation

Variable validation is no longer experimental as of 0.13!

```hcl
variable "my_var" {
  type        = string

  validation {
    condition     = can(regex("^[a-z]*$", var.myvar))
    error_message = "Only lowercase letters are allowed"
  }
}
```