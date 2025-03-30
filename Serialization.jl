using Dates, Serde

struct JuliaCon
    title::String
    start_date::Date
    end_date::Date
end

juliacon = JuliaCon("JuliaCon 2024", Date(2024, 7, 9), Date(2024, 7, 13))

# JSON serialization
function Serde.SerJson.ser_type(::Type{JuliaCon}, v::Date)
    return Dates.format(v, "U d, yyyy")
end

println(to_json(juliacon))

# TOML serialization
function Serde.SerToml.ser_type(::Type{JuliaCon}, v::Date)
    return Dates.format(v, "yyyy-mm-dd")
end

println(to_toml(juliacon))

# XML serialization
function Serde.SerXml.ser_type(::Type{JuliaCon}, v::Date)
    return Dates.format(v, "yyyy-mm-dd")
end

println(to_xml(juliacon))

# YAML serialization
function Serde.SerYaml.ser_type(::Type{JuliaCon}, v::Date)
    return Dates.format(v, "U d, yyyy")
end

println(to_yaml(juliacon))