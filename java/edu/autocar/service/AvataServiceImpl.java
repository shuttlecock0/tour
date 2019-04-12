package edu.autocar.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import edu.autocar.dao.AvataDao;
import edu.autocar.domain.Avata;
import edu.autocar.util.ImageUtil;
import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class AvataServiceImpl implements AvataService {
	@Autowired
	AvataDao dao;

	@Override
	public Avata getAvata(String userId) throws Exception {
		Avata avata = dao.findById(userId);
		if(avata == null) {
			avata = dao.findById("anonymous");
		}
		return avata;
	}

	Avata createAvata(String userId, MultipartFile file) throws Exception {
		if (file == null || file.isEmpty())
			return null;
		Avata avata = new Avata(userId, file.getBytes());
		avata.setImage(ImageUtil.thumb(avata.getImage()));
		return avata;
	}

	@Override
	public void create(String userId, MultipartFile file) throws Exception {
		Avata avata = createAvata(userId, file);
		if(avata != null)
			dao.insert(avata);
	}

	@Override
	public boolean update(String userId, MultipartFile file) throws Exception {
		Avata avata = createAvata(userId, file);
		if(avata == null) return true;
		
		if(dao.update(avata) == 1 ) return true;
		
		return dao.insert(avata) == 1;
	}

	@Override
	public boolean delete(String userId) throws Exception {
		return dao.delete(userId) == 1;
	}
}
