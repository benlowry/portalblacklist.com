using System;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;

namespace PortalBlacklist.Site
{
	public class Global : System.Web.HttpApplication
	{

		protected void Application_Start(object sender, EventArgs e)
		{
			string template;
			
			using(var tr = new StreamReader(Server.MapPath("~/Template.txt")))
			{
				template = tr.ReadToEnd();
			}

			Application["Template"] = template;
			Application["{image_note}"] = ImageToBase64(Image.FromFile(Server.MapPath("~/Assets/Note2.png")));
			Application["{image_chinese}"] = ImageToBase64(Image.FromFile(Server.MapPath("~/Assets/Chinese.png")));
			Application["{image_croatian}"] = ImageToBase64(Image.FromFile(Server.MapPath("~/Assets/Croatian.png")));
			Application["{image_czech}"] = ImageToBase64(Image.FromFile(Server.MapPath("~/Assets/Czech.png")));
			Application["{image_dutch}"] = ImageToBase64(Image.FromFile(Server.MapPath("~/Assets/Dutch.png")));
			Application["{image_english}"] = ImageToBase64(Image.FromFile(Server.MapPath("~/Assets/English.png")));
			Application["{image_estonian}"] = ImageToBase64(Image.FromFile(Server.MapPath("~/Assets/Estonian.png")));
			Application["{image_french}"] = ImageToBase64(Image.FromFile(Server.MapPath("~/Assets/French.png")));
			Application["{image_german}"] = ImageToBase64(Image.FromFile(Server.MapPath("~/Assets/German.png")));
			Application["{image_hebrew}"] = ImageToBase64(Image.FromFile(Server.MapPath("~/Assets/Hebrew.png")));
			Application["{image_hungarian}"] = ImageToBase64(Image.FromFile(Server.MapPath("~/Assets/Hungarian.png")));
			Application["{image_indonesian}"] = ImageToBase64(Image.FromFile(Server.MapPath("~/Assets/Indonesian.png")));
			Application["{image_italian}"] = ImageToBase64(Image.FromFile(Server.MapPath("~/Assets/Italian.png")));
			Application["{image_korean}"] = ImageToBase64(Image.FromFile(Server.MapPath("~/Assets/Korean.png")));
			Application["{image_polish}"] = ImageToBase64(Image.FromFile(Server.MapPath("~/Assets/Polish.png")));
			Application["{image_portuguese}"] = ImageToBase64(Image.FromFile(Server.MapPath("~/Assets/Portuguese.png")));
			Application["{image_russian}"] = ImageToBase64(Image.FromFile(Server.MapPath("~/Assets/Russian.png")));
			Application["{image_slovak}"] = ImageToBase64(Image.FromFile(Server.MapPath("~/Assets/Slovak.png")));
			Application["{image_spanish}"] = ImageToBase64(Image.FromFile(Server.MapPath("~/Assets/Spanish.png")));
			Application["{image_swedish}"] = ImageToBase64(Image.FromFile(Server.MapPath("~/Assets/Swedish.png")));
			Application["{image_taiwanese}"] = ImageToBase64(Image.FromFile(Server.MapPath("~/Assets/Taiwanese.png")));
			Application["{image_ukranian}"] = ImageToBase64(Image.FromFile(Server.MapPath("~/Assets/Ukranian.png")));
		}

		private static string ImageToBase64(Image image)
		{
			using (var ms = new MemoryStream())
			{
				image.Save(ms, ImageFormat.Png);
				var bytes = ms.ToArray();
				return Convert.ToBase64String(bytes);
			}
		}
	}
}