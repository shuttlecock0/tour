package edu.autocar.domain;

import java.util.Date;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class Image {
	private int imageId;
	private int galleryId; 
	private String originalName; 
	private int fileSize; 
	private String mimeType;
	private Date regDate;
}
