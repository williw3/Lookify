package com.leewatterson.lookify.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.leewatterson.lookify.models.Song;
import com.leewatterson.lookify.services.SongService;

@Controller
public class SongsController {
	private final SongService songService;
	public SongsController(SongService songService) {
		this.songService = songService;
	}
	
	@RequestMapping("/songs")
	public String index(Model model) {
		List<Song> songs = songService.allSongs();
		model.addAttribute("songs", songs);
		return "/songs/index.jsp";
	}
	
	@RequestMapping("search/topTen")
	public String topTen(Model model) {
		List<Song> songs = songService.topFive();
		model.addAttribute("songs", songs);
		return "/songs/topTen.jsp";
		
	}
	
	@RequestMapping(value="/search", method=RequestMethod.POST)
	public String artistSearch(@RequestParam(value="artist") String artist, Model model) {
		List<Song> songs = songService.searchArtist(artist);
		model.addAttribute("songs", songs);
		return "/songs/songsByArtist.jsp";
	}
	
	@RequestMapping("/songs/new")
    public String newSong(@ModelAttribute("song") Song song) {
        return "/songs/new.jsp";
    }
	
    @RequestMapping(value="/songs", method=RequestMethod.POST)
    public String create(@Valid @ModelAttribute("song") Song song, BindingResult result) {
        if (result.hasErrors()) {
            return "/songs/new.jsp";
        } else {
            songService.createSong(song);
            return "redirect:/songs";
        }
    }
    
    @RequestMapping("/songs/{id}")
	public String show(@PathVariable("id") Long id, Model model) {
		Song thisSong = songService.findSong(id);
		model.addAttribute("thisSong", thisSong);
		return "/songs/show.jsp";
	}
    
    @RequestMapping(value="/songs/{id}", method=RequestMethod.DELETE)
    public String destroy(@PathVariable("id") Long id) {
    	songService.deleteSong(id);
    	return "redirect:/songs";
    }
}













