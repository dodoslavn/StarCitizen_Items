#!/usr/bin/env node

const fs = require("fs");

const endpoints =
{
    helmets: "https://finder.cstone.space/GetArmors/Legs"
}

function save(name, data) {
    fs.writeFile("../tmp/" + name, data, (err) => {
        if (err) { console.error("Error saving file:", err); }
    });
}

async function Helmets() {
    console.log("########################");
    console.log("### Legs");
    ids = "";
    html_light = "";
    html_medium = "";
    html_heavy = "";

    try {
        const response = await fetch(endpoints.helmets);
        if (!response.ok) { throw new Error(`HTTP error! status: ${response.status}`); }

        const helmetData = await response.json();
        console.log(" > Legs - data downloaded");
        for (const item of helmetData) {
            console.log(" > Legs - name:", item.Name);
            ids += " " + item.ItemId;

            html = "<table><tr><td colspan='2'><h3>" + item.Name + "</h3></td></tr><tr>";
			html += `<td><img onerror="this.onerror=null; this.src='/notfound.png';" src=/legs/` + item.ItemId + `.png></td><td><ul>`;
            for (const [key, value] of Object.entries(item)) 
				{ 
				value_new = String(value).replace(/\\n/g, "<br>");
				if ( key != "Name" && key != "ItemId" && key != "ItemCodeName" )
					{ html += `<li><strong>${key}:</strong> ${value_new}</li>`; }
				}
            html += "</ul></td>";
            html += "</tr></table>\n";
	    if ( item.Atype == "Heavy Armor" )
		{ html_heavy += html; }
	    else if ( item.Atype == "Medium Armor" )
		{ html_medium += html; }
	    else
		 { html_light += html; }
        }
    }
    catch (err) {
        console.error(" > Issue downloading legs:", err.message);
        process.exit(1);
    }
    save("legs.txt", ids);
    save("legs-heavy.html", html_heavy);
    save("legs-medium.html", html_medium);
    save("legs-light.html", html_light);
}

Helmets();
