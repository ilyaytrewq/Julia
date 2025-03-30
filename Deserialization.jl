using Dates, Serde

struct JuliaCon
    title::String
    start_date::Date
    end_date::Date
end

function Serde.deser(::Type{JuliaCon}, ::Type{Date}, v::String)
    return Dates.Date(v, "U d, yyyy")
end

# JSON deserialization
json = """
{
  "title": "JuliaCon 2024",
  "start_date": "July 9, 2024",
  "end_date": "July 13, 2024"
}
"""

juliacon = deser_json(JuliaCon, json)
println(juliacon)

# TOML deserialization
toml = """
title = "JuliaCon 2024"
start_date = "July 9, 2024"
end_date = "July 13, 2024"
"""

juliacon = deser_toml(JuliaCon, toml)
println(juliacon)

# URL query string deserialization
query = "title=JuliaCon 2024&start_date=July 9, 2024&end_date=July 13, 2024"

juliacon = deser_query(JuliaCon, query)
println(juliacon)

# CSV deserialization
csv = """
title,start_date,end_date
"JuliaCon 2024","July 9, 2024","July 13, 2024"
"""

juliacon = deser_csv(JuliaCon, csv)
println(juliacon)

# YAML deserialization
yaml = """
---
title: JuliaCon 2024
start_date: 2024-07-09
end_date: 2024-07-13
"""

juliacon = deser_yaml(JuliaCon, yaml)
println(juliacon)

# XML deserialization
xml = """
<xml title="JuliaCon 2024" start_date="July 9, 2024" end_date="July 13, 2024" />
"""

juliacon = deser_xml(JuliaCon, xml)
println(juliacon)