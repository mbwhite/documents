// Grammar for basic parsing of the Fabric Endorsment Policies
//
// Defined in the documentation at 
// https://hyperledger-fabric.readthedocs.io/en/latest/endorsement-policies.html#endorsement-policy-syntax

// The expression will be an operator with arguments, each of the arguments can be an expression
// The OutOf operator is a bit different as that demands the first agument be a number
Expression 
   =  op:Operator '(' _ args:Some_Expression_Args _ ')' 
      {
         return {op,args}
      }
   / 'OutOf' '(' _ i:Integer _ ',' _ args:Some_Expression_Args _ ')'
   	{
        if ( i > args.length ) expected('OutOf count is too large')
        return {op:'OutOf', count:i, args}
   	}

// The expression arguments can either be principal or expression
Expression_Arg = Expression / Principal

// Support for comma seperated list of expression arguments
Some_Expression_Args 
   = a:Expression_Arg _ ',' _ s:Some_Expression_Args { return [a].concat(s) } 
   / e:Expression_Arg { return [e] }

// Principal is the mspid and the role
Principal = "'" m:mspid'.'r:Role "'" { return { mspid:m.join(''), role:r }  }

// mspid definition
mspid = [a-zA-Z0-9]+

// The two basic boolean operators
Operator = 'AND' / 'OR' 

// comma separated list of roles
Some_Roles = r:Role _ ',' _ s:Some_Roles / r:Role 
Role = 'member' / 'admin' / 'client' / 'peer'

// A number for the OutOf(x, .. , ..) case
Integer "integer"
  = _ [0-9]+ { return parseInt(text(), 10); }

// Whitepsace definition, set to just return as we're not worried about it later
_ "whitespace"
  = [ \t\n\r]* { return }