# Include all rules, which may be customized later
all

# Customized rules are below
rule 'MD007', :indent => 4

# Ignored rules are below
exclude_rule 'MD001' # Header levels should only increment by one level at a time
exclude_rule 'MD002' # First header should be a top level header
exclude_rule 'MD041' # First line in file should be a top level heading
