package com.leewatterson.lookify.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.leewatterson.lookify.models.Song;
import com.leewatterson.lookify.repositories.SongRepository;

@Service
public class SongService {
	private final SongRepository songRepository;
	public SongService(SongRepository songRepository) {
		this.songRepository = songRepository;
	}
	
	public List<Song> allSongs() {
        return songRepository.findAll();
    }
	
	public List<Song> topFive(){
		return songRepository.findTop5ByOrderByRatingDesc();
	}
	
	public List<Song> searchArtist(String search){
		return songRepository.findByArtistContaining(search);
	}


    public Song createSong(Song s) {
        return songRepository.save(s);
    }
    
    public void deleteSong(Long id) {
    	if(songRepository.existsById(id)) {
    		songRepository.deleteById(id);
    		System.out.println("Deleting song " + id);
    	}
    	else {
    		System.out.println("Song not Found");
    	}
    }

    public Song findSong(Long id) {
        Optional<Song> optionalSong = songRepository.findById(id);
        if(optionalSong.isPresent()) {
            return optionalSong.get();
        } else {
            return null;
        }
    }
}
