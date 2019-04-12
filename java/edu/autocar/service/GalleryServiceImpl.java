package edu.autocar.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import edu.autocar.dao.GalleryDao;
import edu.autocar.domain.Gallery;
import edu.autocar.domain.Image;
import edu.autocar.domain.PageInfo;

@Repository
public class GalleryServiceImpl implements GalleryService {
	final static private int PER_PAEGE_COUNT = 6;
	
	@Autowired
	GalleryDao dao;

	@Autowired
	ImageService imageService;

	@Override
	public PageInfo<Gallery> getPage(int page) throws Exception {
		int start = (page - 1) * PER_PAEGE_COUNT;
		int end = start + PER_PAEGE_COUNT;
		int totalCount = dao.count();
		List<Gallery> list = dao.getPage(start, end);
		
		for (Gallery gallery : list) {
			gallery.setList(imageService.getGalleryImages(gallery.getGalleryId()));
		}
		PageInfo<Gallery> pi = new PageInfo<>(totalCount, (int) Math.ceil(totalCount / (double) PER_PAEGE_COUNT), page, PER_PAEGE_COUNT,
				list); 
		pi.setList(list);
		
		return pi;
	}

	@Override
	public Gallery getGallery(int galleryId) throws Exception {
		Gallery gallery = dao.findById(galleryId);
		gallery.setList(imageService.getGalleryImages(gallery.getGalleryId()));
		return gallery;
	}

	@Override
	public List<Gallery> findByOwner(String userId) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void create(Gallery gallery, List<MultipartFile> list) throws Exception {
		dao.insert(gallery);
		
		for (int ix = 0; ix < list.size(); ix++) {
			MultipartFile file = list.get(ix);
			Image image = Image.builder()
						.galleryId(gallery.getGalleryId())
						.originalName(file.getOriginalFilename())
						.fileSize((int)file.getSize())
						.mimeType(file.getContentType())
						.build();
			
			imageService.create(image);
			imageService.saveImage(image, file);
		}
	}

	@Override
	public boolean update(Gallery gallery) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean delete(int galleryId, String password) throws Exception {
		Gallery gallery = dao.findById(galleryId);
		if(gallery.getPassword().equals(password)) {
			imageService.deleteByGalleryId(galleryId);
			return dao.delete(galleryId) == 1;
		}
		return false;
	}

}
