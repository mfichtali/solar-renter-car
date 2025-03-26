package org.solar.system.central.common.all.pojo;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;

@Data
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(callSuper=false)
@SuperBuilder
@JsonInclude(Include.NON_NULL)
public class ErrorWrapper<T> extends BaseWrapper {
	private static final long serialVersionUID = 1L;
	private String description;
	private transient T result;
}
