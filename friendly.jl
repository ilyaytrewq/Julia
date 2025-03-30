using Dates, Serde

@serde @default_value @de_name struct JuliaCon
    title::String    | "JuliaCon 2024"   | "title"
    start_date::Date | nothing           | "start"
    end_date::Date   | Date(2024, 7, 24) | "end"
end

function Serde.deser(::Type{JuliaCon}, ::Type{Date}, v::String)
    return Dates.Date(v)
end

json = """{"title": "JuliaCon 2024", "start": "2024-07-22"}"""

juliacon = deser_json(JuliaCon, json)

println(juliacon)
println(to_json(juliacon))

