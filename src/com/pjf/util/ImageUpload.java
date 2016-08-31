package com.pjf.util;

import java.util.List;
import java.util.UUID;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

@WebServlet(name="imgUpload",urlPatterns={"/fileUp.htm"})
public class ImageUpload extends HttpServlet {
	@Override
	public void service(HttpServletRequest req,HttpServletResponse res) throws IOException, ServletException{
		res.setContentType("text/html;charset=utf-8");
		req.setCharacterEncoding("utf-8");		//ֻ�����POST����
		/*String name = req.getParameter("name");
		// �󲿷������GET������ISO-8859-1��׼�����ύ
		name = new String(name.getBytes("ISO-8859-1"), "utf-8");
		res.getWriter().println(name + ":Hello,JF and everyone! �Ұ�����");*/
		
		//1.���̹��������������ļ�
		FileItemFactory fif=new DiskFileItemFactory();
		//2.�ϴ�����
		ServletFileUpload upload=new ServletFileUpload(fif);
		try {
			List<FileItem> items=upload.parseRequest(req);
			FileItem item=items.get(0);
			//���浽�������� ����·��
			String path=req.getServletContext().getRealPath("/");
			String uuid=UUID.randomUUID().toString()+".jpg";
			//���������
			OutputStream out=new FileOutputStream(path+"/image/"+uuid);
			req.setAttribute("imgPath", "image/"+uuid);
			//�õ�������
			InputStream is=item.getInputStream();
			byte[] buf=new byte[1024];
			int len=0;
			while((len=is.read(buf))!=-1)
			{
				out.write(buf,0,len);
			}
			is.close();
			out.close();
		} catch (FileUploadException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//res.getWriter().println("Upload Successfully!");
		req.getRequestDispatcher("ShowImg.jsp").forward(req, res);
	}
}
