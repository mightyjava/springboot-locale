package com.mightyjava.service.impl;

import java.util.List;

import org.codehaus.jettison.json.JSONException;
import org.codehaus.jettison.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.CachePut;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.cache.annotation.Caching;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.mightyjava.config.MessageConfig;
import com.mightyjava.model.Address;
import com.mightyjava.model.User;
import com.mightyjava.repository.AddressRepository;
import com.mightyjava.repository.UserRepository;
import com.mightyjava.service.AddressService;

@Service
public class AddressServiceImpl implements AddressService {
	@Autowired
	private AddressRepository addressRepository;
	@Autowired
	private UserRepository userRepository;
	@Autowired
	private MessageConfig messageConfig;

	@Override
	@Cacheable("addressCache")
	public List<Address> addressList() {
		return addressRepository.addressList();
	}
	
	@Override
	@Cacheable("addressCache")
	public Page<Address> findAll(Pageable pageable) {
		return addressRepository.findAll(new PageRequest(pageable.getPageNumber() - 1, 5));
	}

	@Override
	public Address findOne(Long id) {
		return addressRepository.findOne(id);
	}

	@Override
	@Caching(put = {
		@CachePut(value = "addressCache", key = "#address")
	})
	//@CachePut(value = "addressCache", key = "#address")
	public String addAddress(Address address) { 
		String message = null;
		JSONObject jsonObject = new JSONObject();
		try {
			if (address.getId() == null) {
				message = messageConfig.getMessage("label.added");
			} else {
				message = messageConfig.getMessage("label.updated");
			}
			User user = userRepository.findOne(address.getUserId());
			address.setUser(user); 
			addressRepository.save(address);
			jsonObject.put("status", "success");
			String[] msg = {message};
			jsonObject.put("title", messageConfig.getMessage("label.confirmation", msg));
			
			String[] msg2 = {user.getFullName(), message};
			jsonObject.put("message", messageConfig.getMessage("address.save.success", msg2));
		} catch (JSONException e) {
			e.printStackTrace();
		}
		return jsonObject.toString();
	}

	@Override
	@CacheEvict(value = "addressCache", allEntries = true)
	public String deleteAddress(Long id) {
		JSONObject jsonObject = new JSONObject();
		try {
			addressRepository.delete(id);
			jsonObject.put("message", messageConfig.getMessage("address.delete.success"));
		} catch (JSONException e) {
			e.printStackTrace();
		}
		return jsonObject.toString();
	}
	
	@Override
	@Caching(evict = {
		@CacheEvict(value = "addressCache", allEntries = true)
	})
	//@CacheEvict(value = "addressCache", allEntries = true)
	public void refreshCache() {
		
	}

}
