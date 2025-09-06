#!/usr/bin/env node

const fs = require("fs");

const endpoints =
{
    helmets: "https://finder.cstone.space/GetArmors/Helmets"
}

function save(name, data) {
    fs.writeFile("../tmp/" + name, data, (err) => {
        if (err) { console.error("Error saving file:", err); }
    });
}

async function Helmets() {
    console.log("########################");
    console.log("### Helmets");
    ids = "";
    html_light = "";
    html_medium = "";
    html_heavy = "";

    try {
        const response = await fetch(endpoints.helmets);
        if (!response.ok) { throw new Error(`HTTP error! status: ${response.status}`); }

        const helmetData = await response.json();
        console.log(" > Helmets - data downloaded");
        for (const item of helmetData) {
            console.log(" > Helmets - name:", item.Name);
            ids += " " + item.ItemId;

            html = "<table><tr><td colspan='2'><h3>" + item.Name + "</h3></td></tr><tr><td><ul>";
            for (const [key, value] of Object.entries(item)) 
				{ 
				if ( key != "Name" && key != "ItemId" && key != "ItemCodeName" )
					{ html += `<li><strong>${key}:</strong> ${value}</li>`; }
				}
            html += "</ul></td>";
            html += `<td><img src=/helmets/` + item.ItemId + `.png></td></tr></table>`;
	    if ( item.Atype == "Heavy Armor" )
		{ html_heavy += html; }
	    else if ( item.Atype == "Medium Armor" )
		{ html_medium += html; }
	    else
		 { html_light += html; }
        }
    }
    catch (err) {
        console.error(" > Issue downloading helmets:", err.message);
        process.exit(1);
    }
    save("helmets.txt", ids);
    save("helmets-heavy.html", html_heavy);
    save("helmets-medium.html", html_medium);
    save("helmets-light.html", html_light);
}

Helmets();

