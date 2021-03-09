package com.example.demo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.config.ConfigDataResourceNotFoundException;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/v1")
public class EmployeeController {
    // 操作物件
    @Autowired
    private EmployeeRepository employeeRepository;

    // GET/employees 取得全部的employee
    @GetMapping("/employees")
    public List<Employee> getAllEmployees() {
        return employeeRepository.findAll();
    }
    //// ----GET---- ////
    // GET/employees/{id} 取得特定員工ID
    @GetMapping("/employees/{id}")
    public ResponseEntity<Employee> getEmployeeById(@PathVariable(value = "id") Long employeeId)
    // ResourceNotFoundException在目前目錄的ResourceNotFoundException.class檔案
    throws ResourceNotFoundException{
        Employee employee = employeeRepository.findById(employeeId)
                // 如果透過那個id還是找不到員工資料的話則回傳訊息說找不到
                .orElseThrow( () -> new ResourceNotFoundException("Employee not found for this id :: " + employeeId));
        // 如果有透過員工id找到員工資料的話則直接回傳員工資料
        return ResponseEntity.ok().body(employee);
    }
    //// ----POST---- ////
    // POST /employees 儲存一筆員工資料
    @PostMapping("/employees")
    public Employee createEmployee(@Valid @RequestBody Employee employee){
        return employeeRepository.save(employee);
    }
    //// ----PUT---- ////
    // PUT /employees/{id} 按照id更新該id的員工資料
    @PutMapping("/employees/{id}")
    public ResponseEntity<Employee> updateEmployee(@PathVariable(value = "id") Long employeeId,
        @Valid @RequestBody Employee employeeDetails) throws ResourceNotFoundException{
        Employee employee = employeeRepository.findById(employeeId)
                // 如果員工id找不到的話回傳說找不到員工ID
                .orElseThrow( ()-> new ResourceNotFoundException("Employee not found for this id, so cant update :: " + employeeId) );
        // 員工id有找到且要更新的資料就儲存在變數employeeDetails
        employee.setEmailId(employeeDetails.getEmailId());
        employee.setLastName(employeeDetails.getLastName());
        employee.setFirstName(employeeDetails.getFirstName());
        // 將資料寫入到資料庫
        final Employee updatedEmployee = employeeRepository.save(employee);
        // 將更新過後的資料顯示給使用者
        return ResponseEntity.ok(updatedEmployee);
    }
    // ----DELETE----
    // DELETE /employees/{id} 刪除該員工id的員工
    @DeleteMapping("/employees/{id}")
    public Map<String, Boolean> deleteEmployee(@PathVariable(value = "id") Long employeeId)
        throws ResourceNotFoundException{
        Employee employee = employeeRepository.findById(employeeId)
                // 如果員工id的找不到的話就不刪除該員工
                .orElseThrow( ()-> new ResourceNotFoundException("Employee not found for this id, so cant delete :: " + employeeId) );
        // 發現員工存在則可以進行刪除該員工
        employeeRepository.delete(employee);
        Map<String, Boolean> response = new HashMap<>();
        response.put("deleted", Boolean.TRUE);
        return response;
    }

}
